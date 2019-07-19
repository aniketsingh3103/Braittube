package com;
import java.applet.Applet;
import java.io.File;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
 
 

 public class choose extends Applet
 {
 

 public choose()
 {
 analyzePath(); 
 } 

 
 private File getFileOrDirectory()
 {
 
JFileChooser fileChooser = new JFileChooser();
fileChooser.setFileSelectionMode(
JFileChooser.FILES_AND_DIRECTORIES );
int result = fileChooser.showOpenDialog( this );
if (result == JFileChooser.CANCEL_OPTION )
 System.exit( 1 );
File fileName = fileChooser.getSelectedFile();
if ( ( fileName == null ) || ( fileName.getName().equals( "" ) ) )
 {
 JOptionPane.showMessageDialog( this, "Invalid Name","Invalid Name", JOptionPane.ERROR_MESSAGE );
 System.exit( 1 );
 } 

 return fileName;
 } 

 
 public void analyzePath()
 {

 File name = getFileOrDirectory();

 if ( name.exists() ) {
     //System.out.printf("%s%s\n%s\n%s",name.getName(),"exists",name.lastModified(),"Length:", name.length() );
if ( name.isDirectory() )
 {
 String[] directory = name.list();
 System.exit(1);

 }
  System.exit(1);
 } 
 else {
 } 
 } }
