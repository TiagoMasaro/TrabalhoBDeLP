/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

//import java.beans.Transient;
import java.io.Serializable;
//import java.text.SimpleDateFormat;
//import java.util.Calendar;
import java.util.Objects;

/**
 *
 * @author 12968505602
 */
public class Receita implements Serializable{
    private Integer codigo;
    private String remediosPrescritos;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getRemediosPrescritos() {
        return remediosPrescritos;
    }

    public void setRemediosPrescritos(String remediosPrescritos) {
        this.remediosPrescritos = remediosPrescritos;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 47 * hash + Objects.hashCode(this.codigo);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Receita other = (Receita) obj;
        if (!Objects.equals(this.codigo, other.codigo)) {
            return false;
        }
        return true;
    }
    

 
    /*@Transient //não persiste em banco de dados
    public String getNascimentoFormatado(){
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(nascimento.getTime());
    }
    */
}
