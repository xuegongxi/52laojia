package cn.laojia.common;
import java.awt.Color;  
import java.awt.Graphics2D;  
import java.awt.Image;  
import java.awt.image.BufferedImage;  
import java.io.File;  
import java.io.FileNotFoundException;  
import java.io.IOException;  
  
import javax.imageio.ImageIO;  
public class ImagesUtil {
	 public static void main(String[] args) {  
		    zipImageFile(new File("F:\\2.jpg"),new File("F:\\2-1.jpg"),200,0,0.7f);  
	          
	        //zipImageFile(new File("C:\\spider\\2.JPG"),new File("C:\\spider\\2-2.JPG"),425,638,0.7f);  
	          
	        //zipImageFile(new File("C:\\spider\\3.jpg"),new File("C:\\spider\\3-3.jpg"),425,638,0.7f);  
	          
	        System.out.println("ok");  
	    }  
	    
	    /**  
	     * �������õĿ�ߵȱ���ѹ��ͼƬ�ļ�<br> �ȱ���ԭ�ļ�����ѹ�����ϴ�  
	     * @param oldFile  Ҫ����ѹ�����ļ�  
	     * @param newFile  ���ļ�  
	     * @param width  ��� //���ÿ��ʱ���߶ȴ���0���ȱ������ţ�  
	     * @param height �߶� //���ø߶�ʱ����ȴ���0���ȱ������ţ�  
	     * @param quality ����  
	     * @return ����ѹ������ļ���ȫ·��  
	     */    
	    public static String zipImageFile(File oldFile,File newFile, int width, int height,float quality) {    
	        if (oldFile == null) {    
	            return null;    
	        }    
	        try {    
	            /** �Է������ϵ���ʱ�ļ����д��� */    
	            Image srcFile = ImageIO.read(oldFile);    
	            int w = srcFile.getWidth(null);    
	            int h = srcFile.getHeight(null);    
	            double bili;    
	            if(width>0){    
	                bili=width/(double)w;    
	                height = (int) (h*bili);    
	            }else{    
	                if(height>0){    
	                    bili=height/(double)h;    
	                    width = (int) (w*bili);    
	                }    
	            }    
	              
	            String srcImgPath = newFile.getAbsoluteFile().toString();  
	            System.out.println(srcImgPath);  
	            String subfix = "jpg";  
	            subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".")+1,srcImgPath.length());  
	  
	            BufferedImage buffImg = null;   
	            if(subfix.equals("png")){  
	                buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);  
	            }else{  
	                buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
	            }  
	  
	            Graphics2D graphics = buffImg.createGraphics();  
	            graphics.setBackground(new Color(255,255,255));  
	            graphics.setColor(new Color(255,255,255));  
	            graphics.fillRect(0, 0, width, height);  
	            graphics.drawImage(srcFile.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);    
	  
	            ImageIO.write(buffImg, subfix, new File(srcImgPath));    
	    
	        } catch (FileNotFoundException e) {    
	            e.printStackTrace();    
	        } catch (IOException e) {    
	            e.printStackTrace();    
	        }    
	        return newFile.getAbsolutePath();    
	    }    
	    
	    /**  
	     * �����õĿ�ȸ߶�ѹ��ͼƬ�ļ�<br> �ȱ���ԭ�ļ�����ѹ�����ϴ�  
	     * @param oldFile  Ҫ����ѹ�����ļ�ȫ·��  
	     * @param newFile  ���ļ�  
	     * @param width  ���  
	     * @param height �߶�  
	     * @param quality ����  
	     * @return ����ѹ������ļ���ȫ·��  
	     */    
	    public static String zipWidthHeightImageFile(File oldFile,File newFile, int width, int height,float quality) {    
	        if (oldFile == null) {    
	            return null;    
	        }    
	        String newImage = null;    
	        try {    
	            /** �Է������ϵ���ʱ�ļ����д��� */    
	            Image srcFile = ImageIO.read(oldFile);    
	              
	            String srcImgPath = newFile.getAbsoluteFile().toString();  
	            System.out.println(srcImgPath);  
	            String subfix = "jpg";  
	            subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".")+1,srcImgPath.length());  
	  
	            BufferedImage buffImg = null;   
	            if(subfix.equals("png")){  
	                buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);  
	            }else{  
	                buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
	            }  
	  
	            Graphics2D graphics = buffImg.createGraphics();  
	            graphics.setBackground(new Color(255,255,255));  
	            graphics.setColor(new Color(255,255,255));  
	            graphics.fillRect(0, 0, width, height);  
	            graphics.drawImage(srcFile.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);    
	  
	            ImageIO.write(buffImg, subfix, new File(srcImgPath));    
	        } catch (FileNotFoundException e) {    
	            e.printStackTrace();    
	        } catch (IOException e) {    
	            e.printStackTrace();    
	        }    
	        return newImage;    
	    }    

}



