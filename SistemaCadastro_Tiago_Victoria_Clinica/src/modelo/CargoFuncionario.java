/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Objects;

public class CargoFuncionario implements Serializable{ // padrão java beans
    private Integer codCargo;
    private String nomeCargo;

    public Integer getCodCargo() {
        return codCargo;
    }

    public void setCodCargo(Integer codCargo) {
        this.codCargo = codCargo;
    }

    public String getNomeCargo() {
        return nomeCargo;
    }

    public void setNomeCargo(String nomeCargo) {
        this.nomeCargo = nomeCargo;
    }

    @Override
    public int hashCode() {
        int hash = 5;
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
        final CargoFuncionario other = (CargoFuncionario) obj;
        if (!Objects.equals(this.nomeCargo, other.nomeCargo)) {
            return false;
        }
        if (!Objects.equals(this.codCargo, other.codCargo)) {
            return false;
        }
        return true;
    }
    

   
    

}
