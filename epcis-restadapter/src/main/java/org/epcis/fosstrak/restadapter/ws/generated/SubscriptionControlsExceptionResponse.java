package org.epcis.fosstrak.restadapter.ws.generated;

import javax.xml.ws.WebFault;

/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.1.1 in JDK 6
 * Generated source version: 2.1
 * 
 */
@WebFault(name = "SubscriptionControlsException", targetNamespace = "urn:epcglobal:epcis-query:xsd:1")
public class SubscriptionControlsExceptionResponse
        extends Exception {

    /**
     * Java type that goes as soapenv:Fault detail element.
     * 
     */
    private SubscriptionControlsException faultInfo;

    /**
     * 
     * @param message
     * @param faultInfo
     */
    public SubscriptionControlsExceptionResponse(String message, SubscriptionControlsException faultInfo) {
        super(message);
        this.faultInfo = faultInfo;
    }

    /**
     * 
     * @param message
     * @param faultInfo
     * @param cause
     */
    public SubscriptionControlsExceptionResponse(String message, SubscriptionControlsException faultInfo, Throwable cause) {
        super(message, cause);
        this.faultInfo = faultInfo;
    }

    /**
     * 
     * @return
     *     returns fault bean: ch.diuf.unifr.softeng.gen.SubscriptionControlsException
     */
    public SubscriptionControlsException getFaultInfo() {
        return faultInfo;
    }
}
