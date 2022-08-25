package com.PrisonManager;

import java.io.*;
public class  DirListing
{
	private File[] FileList = new File[100];
	private int i=0;
	public void DirListing()
	{
		System.out.println("DirListing Object created------");
	}
	public File[] getFileList()
	{
		return this.FileList;
	}
	// Process all files and directories under dir
    public  void visitAllDirsAndFiles(File dir) {
		process(dir);
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i=0; i<children.length; i++) {
                visitAllDirsAndFiles(new File(dir, children[i]));
            }
        }
    }
    
    // Process only directories under dir
    public  void visitAllDirs(File dir) {
        if (dir.isDirectory()) {
            process(dir);
    
            String[] children = dir.list();
            for (int i=0; i<children.length; i++) {
                visitAllDirs(new File(dir, children[i]));
            }
        }
    }
    
    // Process only files under dir
    public  void visitAllFiles(File dir){
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i=0; i<children.length; i++) {
                visitAllFiles(new File(dir, children[i]));
            }
        } else {
            process(dir);
        }
    }
	public void process(File dir){
		if(dir.isDirectory()){
		        System.out.println("FOLDER--"+dir);
				FileList[i] = dir;
				i++;
		}
		else{
				String Ftype = dir.toString().substring(dir.toString().indexOf('.')+1,dir.toString().length());
				System.out.println(Ftype+"----FILE--"+dir);
				FileList[i] = dir;
				i++;
		}
	}
}
