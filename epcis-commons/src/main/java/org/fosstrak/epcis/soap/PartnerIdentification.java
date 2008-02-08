package org.accada.epcis.soap;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.XmlValue;

/**
 * <p>
 * Java class for PartnerIdentification complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;PartnerIdentification&quot;&gt;
 *   &lt;simpleContent&gt;
 *     &lt;extension base=&quot;&lt;http://www.w3.org/2001/XMLSchema&gt;string&quot;&gt;
 *       &lt;attribute name=&quot;Authority&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; /&gt;
 *     &lt;/extension&gt;
 *   &lt;/simpleContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "PartnerIdentification", propOrder = { "value" })
public class PartnerIdentification {

    @XmlValue
    protected String value;
    @XmlAttribute(name = "Authority")
    protected String authority;

    /**
     * Gets the value of the value property.
     * 
     * @return possible object is {@link String }
     */
    public String getValue() {
        return value;
    }

    /**
     * Sets the value of the value property.
     * 
     * @param value
     *            allowed object is {@link String }
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * Gets the value of the authority property.
     * 
     * @return possible object is {@link String }
     */
    public String getAuthority() {
        return authority;
    }

    /**
     * Sets the value of the authority property.
     * 
     * @param value
     *            allowed object is {@link String }
     */
    public void setAuthority(String value) {
        this.authority = value;
    }

}
