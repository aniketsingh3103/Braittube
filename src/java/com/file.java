package com;


import java.io.FileNotFoundException;
import java.util.Formatter;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class file
 {
    Formatter out;
    private static final String FILENAME = "C:\\test\\iplog.txt";
    private static  final String MACFILE="C:\\test\\maclog.txt";

    
 public String[] analyzePath( String path )
 { 
File name = new File( path );
String s="null";
String[] directory=null;    

 if (name.exists() ) 
 {
    if ( name.isDirectory()) 
                {  
                    directory = name.list();
 
                    for ( String directoryName : directory ){
                            s=directoryName;
                                                            }
                }} 
return directory;
 }
 
 public boolean getfile( int path )
 { 
File name = new File("C:\\test\\vedios\\"+path+".mp4");

if (name.exists() ) 
 {
     return true;
    } else{
     return false;
 }

 }
 
 
 
 
 public void put_file() throws FileNotFoundException{
     out=new Formatter("C:\\test\\vedios.txt");
     file f=new file();
     int i=0;
     String[] file_name=f.analyzePath("C:\\test\\insert");
        for (String file_name1 : file_name) {
            out.format("%d  %s; ",i++, file_name1);
        } 
        if(out!=null){
            out.close();
        }
     
 }
 
 public void put_ip(String ved,String ip){
     
                BufferedWriter bw = null;
		FileWriter fw = null;

		try {

			String data = ved+"|"+ip+"\t";

			File file = new File(FILENAME);

			
			if (!file.exists()) {
				file.createNewFile();
			}

			
			fw = new FileWriter(file.getAbsoluteFile(), true);
			bw = new BufferedWriter(fw);

			bw.write(data);

			
		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				if (bw != null)
					bw.close();

				if (fw != null)
					fw.close();

			} catch (IOException ex) {

				ex.printStackTrace();

			}
		}
 }
                
                
                public void put_mac(int ved,String ip,String mac,String host){
     
                BufferedWriter bw = null;
		FileWriter fw = null;

		try {

			String data = "#"+ved+"|"+ip+"|"+mac+"|"+host+"\t";

			File file = new File(MACFILE);

			
			if (!file.exists()) {
				file.createNewFile();
			}

			
			fw = new FileWriter(file.getAbsoluteFile(), true);
			bw = new BufferedWriter(fw);

			bw.write(data);

			
		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				if (bw != null)
					bw.close();

				if (fw != null)
					fw.close();

			} catch (IOException ex) {

				ex.printStackTrace();

			}
		}
                
                

	}


 
 
 
 
 
}