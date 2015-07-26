/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.sboehme.wysisygjsp;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.jcr.RepositoryException;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.servlets.post.AbstractPostOperation;
import org.apache.sling.servlets.post.Modification;
import org.apache.sling.servlets.post.PostResponse;

/**
 * Streams the content of the property specified by the request parameter
 * 'property' to the response of the request.
 */
@Component
@Service(org.apache.sling.servlets.post.PostOperation.class)
@Properties({
		@Property(name = "service.description", value = "Servlet for modifying a JSP"),
		@Property(name = "service.vendor", value = "Sandro Boehme"),
		@Property(name = "sling.post.operation", value = "modify-jsp")

})
public class ModifyJSPServlet extends AbstractPostOperation {

	private static final long serialVersionUID = -1L;

	@Override
	protected void doRun(SlingHttpServletRequest request, PostResponse postResponse, List<Modification> modifications) throws RepositoryException {
		Resource resource = request.getResource();
		File file= resource.adaptTo(File.class);
		InputStream fileInputStream = null;
		PrintWriter out = null;
		try {
			fileInputStream = new FileInputStream(file);
			String jspString = readJSPStreamIntoString(fileInputStream);
			jspString = jspString.replace("<div id=\"new-text-id\"></div>", "<div id=\"new-text-id\"><h1>Yay, changed at the server side!</h1></div>");
			out = new PrintWriter(file);
			out.println(jspString);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fileInputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.close();
		}
		
	}

	private String readJSPStreamIntoString(InputStream stream) {
		BufferedInputStream bis = new BufferedInputStream(stream);
	    ByteArrayOutputStream buf = new ByteArrayOutputStream();
	    try {
			int result = bis.read();
			while(result != -1) {
			  byte b = (byte)result;
			  buf.write(b);
			  result = bis.read();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}        
	    return buf.toString();
	}
}
