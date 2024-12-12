/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.text.SimpleDateFormat;
import java.util.Calendar; //Importação para o Calendar
import org.jdesktop.beansbinding.Converter;//Importação do Coverter

/**
 *
 * @author 12968505602
 */
public class ConverteData extends Converter{
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

    
    //converter o objeto para a Tela do usuário "convertForward"
    @Override
    public Object convertForward(Object value) {
         Calendar c = (Calendar) value;
         return sdf.format(c.getTime());
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    //converter a tela do usuário para o objeto "convertReverse"
    @Override
    public Object convertReverse(Object value) {
        String str = (String)value;
        Calendar c = Calendar.getInstance();
        try{
            c.setTime(sdf.parse(str));
            return c;
        }catch(Exception ex){
            return null;
        }   
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
