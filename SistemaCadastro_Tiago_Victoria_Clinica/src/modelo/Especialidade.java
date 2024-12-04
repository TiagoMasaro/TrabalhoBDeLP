/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author tulio
 */
public class Especialidade implements Serializable{ // padrão java beans
    private Integer codEspecialidade;
    private String nomeEspecialidade;
    

    public Especialidade() { // padrão java beans
    }

    public Integer getCodEspecialidade() {
        return codEspecialidade;
    }

    public void setCodEspecialidade(Integer codEspecialidade) {
        this.codEspecialidade = codEspecialidade;
    }

    public String getNomeEspecialidade() {
        return nomeEspecialidade;
    }

    public void setNomeEspecialidade(String nomeEspecialidade) {
        this.nomeEspecialidade = nomeEspecialidade;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.codEspecialidade);
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
        final Especialidade other = (Especialidade) obj;
        if (!Objects.equals(this.codEspecialidade, other.codEspecialidade)) {
            return false;
        }
        return true;
    }

    

   

    

}
