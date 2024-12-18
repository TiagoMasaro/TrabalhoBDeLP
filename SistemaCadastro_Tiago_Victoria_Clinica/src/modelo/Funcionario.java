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
public class Funcionario implements Serializable{
    private Integer codMedico;
    private String nome;
    private Double salario;
    private CargoFuncionario objcargoFuncionario;

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

    public Double getSalario() {
        return salario;
    }

    public void setSalario(Double salario) {
        this.salario = salario;
    }

    public CargoFuncionario getObjcargoFuncionario() {
        return objcargoFuncionario;
    }

    public void setObjcargoFuncionario(CargoFuncionario objcargoFuncionario) {
        this.objcargoFuncionario = objcargoFuncionario;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 59 * hash + Objects.hashCode(this.codMedico);
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
        final Funcionario other = (Funcionario) obj;
        if (!Objects.equals(this.codMedico, other.codMedico)) {
            return false;
        }
        return true;
    }

    

}
