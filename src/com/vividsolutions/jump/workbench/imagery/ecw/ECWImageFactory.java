package com.vividsolutions.jump.workbench.imagery.ecw;

/*
 * The Unified Mapping Platform (JUMP) is an extensible, interactive GUI 
 * for visualizing and manipulating spatial features with geometry and attributes.
 *
 * Copyright (C) 2003 Vivid Solutions
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 * 
 * For more information, contact:
 *
 * Vivid Solutions
 * Suite #1A
 * 2328 Government Street
 * Victoria BC  V8T 5G5
 * Canada
 *
 * (250)385-6040
 * www.vividsolutions.com
 */
import java.nio.charset.Charset;

import com.vividsolutions.jump.I18N;
import com.vividsolutions.jump.JUMPException;
import com.vividsolutions.jump.workbench.WorkbenchContext;
import com.vividsolutions.jump.workbench.imagery.ReferencedImage;
import com.vividsolutions.jump.workbench.imagery.ReferencedImageFactory;

import org.apache.log4j.Logger;

/**
 */
public class ECWImageFactory implements ReferencedImageFactory {

	private Logger logger = Logger.getLogger(ECWImageFactory.class);	
	
    private static final String TYPE_NAME = "ECW";
    private static final String DESCRIPTION = "Enhanced Compressed Wavelet";
    private static final String[] EXTENSIONS = new String[]{ "ecw" };
    final static String sNotInstalled=I18N.get("org.openjump.core.ui.plugin.layer.AddSIDLayerPlugIn.not-installed");

    public ECWImageFactory() {
    }

    public String getTypeName() {
        return TYPE_NAME;
    }

    public ReferencedImage createImage(String location) throws Exception {
        // prevent a weird bug of the ecw libs not being able to handle accented
        // and extended chars in general
        if (!Charset.forName("ISO-8859-1").newEncoder().canEncode(location)) {
            String hint = location.replaceAll("[^\\u0000-\\u00FF]", "?");
            throw new ECWLoadException(
                    I18N.getMessage(
                            "com.vividsolutions.jump.workbench.imagery.ecw.path-contains-nonansi-chars",
                            new Object[] { hint }));
        }

        return new ECWImage(location);
    }

    public String getDescription() {
        return DESCRIPTION;
    }

    public String[] getExtensions() {
        return EXTENSIONS;
    }

    public boolean isEditableImage(String location) {
        return false;
    }

	public boolean isAvailable(WorkbenchContext context) {
		Class c = null;
		try{
			c = this.getClass().getClassLoader().loadClass(
                JNCSRendererProxy.RENDERER_CLASS);

		}catch(ClassNotFoundException e){
			// eat it
			logger.warn("ECW loader class " + JNCSRendererProxy.RENDERER_CLASS + " " + sNotInstalled);
			return false;
		}
		logger.trace("found ECW loader class");
		return c != null;
	}

}
