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
public class Medico implements Serializable{
    private Integer codigo, objespecialidade_codEspecialidade;
    private String nome, cpf, crm, email;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getCrm() {
        return crm;
    }

    public void setCrm(String crm) {
        this.crm = crm;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getObjespecialidade_codEspecialidade() {
        return objespecialidade_codEspecialidade;
    }

    public void setObjespecialidade_codEspecialidade(Integer objespecialidade_codEspecialidade) {
        this.objespecialidade_codEspecialidade = objespecialidade_codEspecialidade;
    }

    

    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + Objects.hashCode(this.codigo);
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
        final Medico other = (Medico) obj;
        if (!Objects.equals(this.codigo, other.codigo)) {
            return false;
        }
        return true;
    }
   
    
}
