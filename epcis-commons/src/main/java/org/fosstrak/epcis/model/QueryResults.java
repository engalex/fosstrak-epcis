package org.fosstrak.epcis.model;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import org.w3c.dom.Element;

/**
 * <p>
 * Java class for QueryResults complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="QueryResults">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="queryName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="subscriptionID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="resultsBody" type="{urn:epcglobal:epcis-query:xsd:1}QueryResultsBody"/>
 *         &lt;element name="extension" type="{urn:epcglobal:epcis-query:xsd:1}QueryResultsExtensionType" minOccurs="0"/>
 *         &lt;any processContents='lax' namespace='##other' maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "QueryResults", propOrder = { "queryName", "subscriptionID", "resultsBody", "extension", "any" })
public class QueryResults {

    @XmlElement(required = true)
    protected String queryName;
    protected String subscriptionID;
    @XmlElement(required = true)
    protected QueryResultsBody resultsBody;
    protected QueryResultsExtensionType extension;
    @XmlAnyElement(lax = true)
    protected List<Object> any;

    /**
     * Gets the value of the queryName property.
     * 
     * @return possible object is {@link String }
     */
    public String getQueryName() {
        return queryName;
    }

    /**
     * Sets the value of the queryName property.
     * 
     * @param value
     *            allowed object is {@link String }
     */
    public void setQueryName(String value) {
        this.queryName = value;
    }

    /**
     * Gets the value of the subscriptionID property.
     * 
     * @return possible object is {@link String }
     */
    public String getSubscriptionID() {
        return subscriptionID;
    }

    /**
     * Sets the value of the subscriptionID property.
     * 
     * @param value
     *            allowed object is {@link String }
     */
    public void setSubscriptionID(String value) {
        this.subscriptionID = value;
    }

    /**
     * Gets the value of the resultsBody property.
     * 
     * @return possible object is {@link QueryResultsBody }
     */
    public QueryResultsBody getResultsBody() {
        return resultsBody;
    }

    /**
     * Sets the value of the resultsBody property.
     * 
     * @param value
     *            allowed object is {@link QueryResultsBody }
     */
    public void setResultsBody(QueryResultsBody value) {
        this.resultsBody = value;
    }

    /**
     * Gets the value of the extension property.
     * 
     * @return possible object is {@link QueryResultsExtensionType }
     */
    public QueryResultsExtensionType getExtension() {
        return extension;
    }

    /**
     * Sets the value of the extension property.
     * 
     * @param value
     *            allowed object is {@link QueryResultsExtensionType }
     */
    public void setExtension(QueryResultsExtensionType value) {
        this.extension = value;
    }

    /**
     * Gets the value of the any property.
     * <p>
     * This accessor method returns a reference to the live list, not a
     * snapshot. Therefore any modification you make to the returned list will
     * be present inside the JAXB object. This is why there is not a
     * <CODE>set</CODE> method for the any property.
     * <p>
     * For example, to add a new item, do as follows:
     * 
     * <pre>
     * getAny().add(newItem);
     * </pre>
     * <p>
     * Objects of the following type(s) are allowed in the list {@link Element }
     * {@link Object }
     */
    public List<Object> getAny() {
        if (any == null) {
            any = new ArrayList<Object>();
        }
        return this.any;
    }

}
