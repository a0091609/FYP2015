/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Philson
 */
@Entity
public class Quest implements Serializable
{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String description;
    private String fileURL;
    @Temporal(TemporalType.TIMESTAMP)
    private Date releaseDate;
    @Temporal(TemporalType.TIMESTAMP)
    private Date closingDate;
    @OneToOne
    private Key keyRequired;

    public Key getKeyRequired()
    {
        return keyRequired;
    }

    public void setKeyRequired(Key keyRequired)
    {
        this.keyRequired = keyRequired;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getFileURL()
    {
        return fileURL;
    }

    public void setFileURL(String fileURL)
    {
        this.fileURL = fileURL;
    }

    public Date getReleaseDate()
    {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate)
    {
        this.releaseDate = releaseDate;
    }

    public Date getClosingDate()
    {
        return closingDate;
    }

    public void setClosingDate(Date closingDate)
    {
        this.closingDate = closingDate;
    }

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Quest))
        {
            return false;
        }
        Quest other = (Quest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id)))
            return false;
        return true;
    }

    @Override
    public String toString()
    {
        return "entity.Quest[ id=" + id + " ]";
    }
    
}
