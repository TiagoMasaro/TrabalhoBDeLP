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
    private Integer codMedico;
    private String nome, cpf, crm, email;
    private Especialidade objEspecialidade;

    public Integer getCodMedico() {
        return codMedico;
    }

    public void setCodMedico(Integer codMedico) {
        this.codMedico = codMedico;
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

    public Especialidade getObjEspecialidade() {
        return objEspecialidade;
    }

    public void setObjEspecialidade(Especialidade objEspecialidade) {
        this.objEspecialidade = objEspecialidade;
    }

    @Override
    public int hashCode() {
        int hash = 7;
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
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        if (!Objects.equals(this.cpf, other.cpf)) {
            return false;
        }
        if (!Objects.equals(this.crm, other.crm)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.codMedico, other.codMedico)) {
            return false;
        }
        if (!Objects.equals(this.objEspecialidade, other.objEspecialidade)) {
            return false;
        }
        return true;
    }

  


}
