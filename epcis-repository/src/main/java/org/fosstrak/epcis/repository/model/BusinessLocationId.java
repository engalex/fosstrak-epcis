/*
 * Copyright (C) 2008 ETH Zurich
 *
 * This file is part of Fosstrak (www.fosstrak.org).
 *
 * Fosstrak is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License version 2.1, as published by the Free Software Foundation.
 *
 * Fosstrak is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with Fosstrak; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
 */

package org.fosstrak.epcis.repository.model;

import org.fosstrak.epcis.repository.EpcisConstants;

/**
 * A vocabulary type for representing business location identifiers, per section
 * 7.2.3 of the spec.
 * 
 * @author Sean Wellington
 */
public class BusinessLocationId extends VocabularyElement {

	
    /**
	 * added by nkef
	 */
	private static final long serialVersionUID = 1493903119230059528L;
	
	
    @Override
    public String getVocabularyType() {
        return EpcisConstants.BUSINESS_LOCATION_ID;
    }

}
