/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pueblosdeespaña78;

import java.math.BigDecimal;
import java.util.Objects;

/**
 *
 * @author Usuario
 */
public class Provincias2 {
    private BigDecimal idprovincia;
    private String provincia;

    public Provincias2(BigDecimal idprovincia, String provincia) {
        this.idprovincia = idprovincia;
        this.provincia = provincia;
    }

    public BigDecimal getIdprovincia() {
        return idprovincia;
    }

    public void setIdprovincia(BigDecimal idprovincia) {
        this.idprovincia = idprovincia;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
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
        final Provincias2 other = (Provincias2) obj;
        if (!Objects.equals(this.idprovincia, other.idprovincia)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return provincia;
    }
    
    
    
    
}
