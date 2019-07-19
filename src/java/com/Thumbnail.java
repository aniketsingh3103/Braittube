package com;
import org.jcodec.api.FrameGrab;
import org.jcodec.common.model.ColorSpace;
import org.jcodec.common.model.Picture;
import static org.jcodec.scale.AWTUtil.toBufferedImage;
import org.jcodec.scale.ColorUtil;
import org.jcodec.scale.Transform;
import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
public class Thumbnail {
    public static void testSingleFrame(String path) throws Exception {
  int frameNumber = 150;
  Picture frame = FrameGrab.getNativeFrame(new File("C:\\test\\vedios\\"+path), frameNumber);

        Transform transform = ColorUtil.getTransform(frame.getColor(), ColorSpace.RGB);
        Picture rgb = Picture.create(frame.getWidth(), frame.getHeight(), ColorSpace.RGB);
        transform.transform(frame, rgb);
        BufferedImage bi = toBufferedImage(rgb);
        path=path.replace(".mp4","");
       ImageIO.write(bi, "png", new File("C:\\test\\thumbnail\\"+path+".png"));
 }
 
    
    public static void resize_thumb(String filename) throws IOException {
        
        //File folder = new File("E:\\test\\thumbnail\\");
      //  File[] listOfFiles = folder.listFiles();
        //System.out.println("Total No of Files:"+listOfFiles.length);
        BufferedImage img = null;
       // BufferedImage tempPNG = null;
        BufferedImage tempJPG = null;
       // File newFilePNG = null;
        File newFileJPG = null;
       // for (int i = 0; i < listOfFiles.length; i++) {
              //if (filename.isFile()) {
               // System.out.println("File " + listOfFiles[i].getName());
                img = ImageIO.read(new File("C:\\test\\thumbnail\\"+filename));
                tempJPG = resizeImage(img, img.getWidth(), img.getHeight());
                newFileJPG = new File("C:\\test\\thumbnail\\"+filename);
                ImageIO.write(tempJPG, "png", newFileJPG);
             // }
     //   }
        
    }

    
        public static BufferedImage resizeImage(final Image image, int width, int height) {
    int targetw = 0;
    int targeth = 75;

    if (width > height)targetw = 112;
    else targetw = 50;

    do {
        if (width > targetw) {
            width /= 2;
            if (width < targetw) width = targetw;
        }

        if (height > targeth) {
            height /= 2;
            if (height < targeth) height = targeth;
        }
    } while (width != targetw || height != targeth);

    final BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    final Graphics2D graphics2D = bufferedImage.createGraphics();
    graphics2D.setComposite(AlphaComposite.Src);
    graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION,RenderingHints.VALUE_INTERPOLATION_BILINEAR);
    graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING,RenderingHints.VALUE_RENDER_QUALITY);
    graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
    graphics2D.drawImage(image, 0, 0, width, height, null);
    graphics2D.dispose();

    return bufferedImage;
}
        
        
        
    }


