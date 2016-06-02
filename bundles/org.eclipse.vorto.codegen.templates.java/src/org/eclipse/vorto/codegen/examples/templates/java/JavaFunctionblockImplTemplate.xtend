/*******************************************************************************
 * Copyright (c) 2015 Bosch Software Innovations GmbH and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * and Eclipse Distribution License v1.0 which accompany this distribution.
 *   
 * The Eclipse Public License is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * The Eclipse Distribution License is available at
 * http://www.eclipse.org/org/documents/edl-v10.php.
 *   
 * Contributors:
 * Bosch Software Innovations GmbH - Please refer to git log
 *******************************************************************************/
package org.eclipse.vorto.codegen.examples.templates.java

import org.eclipse.vorto.codegen.api.ITemplate
import org.eclipse.vorto.core.api.model.datatype.Property
import org.eclipse.vorto.core.api.model.functionblock.FunctionblockModel
import org.eclipse.vorto.core.api.model.functionblock.Operation
import org.eclipse.vorto.codegen.api.mapping.InvocationContext

class JavaFunctionblockImplTemplate implements ITemplate<FunctionblockModel>{
	
	var String classPackage
	var String interfacePrefix
	var String implSuffix
	var String[] imports
	var ITemplate<Property> propertyTemplate
	var ITemplate<Operation> operationTemplate
	
	new(String classPackage,
		String interfacePrefix,
		String implSuffix, 
		String[] imports,
		ITemplate<Property> propertyTemplate,
		ITemplate<Operation> operationTemplate
	) {
		this.classPackage=classPackage
		this.interfacePrefix = interfacePrefix
		this.implSuffix = implSuffix
		this.imports = imports
		this.propertyTemplate = propertyTemplate
		this.operationTemplate = operationTemplate
	}
	
	override getContent(FunctionblockModel fbm,InvocationContext invocationContext) {
		'''
			/*
			*****************************************************************************************
			* The present code has been generated by the Eclipse Vorto Java Code Generator.
			*
			* The basis for the generation was the Functionblock which is uniquely identified by:
			* Name:			«fbm.name»
			* Namespace:	«fbm.namespace»
			* Version:		«fbm.version»
			*****************************************************************************************
			*/
			
			package «classPackage»;
			
			«FOR imprt: imports»
				import «imprt».*;
			«ENDFOR»
			
			/**
			* «fbm.description»
			*/
			public class «fbm.name»«implSuffix» implements «interfacePrefix»«fbm.name» {
				«var fb = fbm.functionblock»	
				«IF fb.status != null»
					private «fbm.name»Status «fbm.name.toLowerCase»Status = null;
				«ENDIF»
				«IF fb.configuration != null» 
					private «fbm.name»Configuration «fbm.name.toLowerCase»Configuration = null;
				«ENDIF»
				«IF fb.fault != null»
					private «fbm.name»Fault «fbm.name.toLowerCase»Fault = null;
				«ENDIF»
				«IF fb.status != null»
					public «fbm.name»Status get«fbm.name»Status() {
						return this.«fbm.name.toLowerCase»Status;
					}
					
					public void set«fbm.name»Status(«fbm.name»Status «fbm.name.toLowerCase»Status) {
						this.«fbm.name.toLowerCase»Status = «fbm.name.toLowerCase»Status;
					}
				«ENDIF»
				«IF fb.configuration != null»
					public «fbm.name»Configuration get«fbm.name»Configuration() {
						return this.«fbm.name.toLowerCase»Configuration;
					}
					
					public void set«fbm.name»Configuration(«fbm.name»Configuration «fbm.name.toLowerCase»Configuration) {
						this.«fbm.name.toLowerCase»Configuration = «fbm.name.toLowerCase»Configuration;
					}
				«ENDIF»
				«IF fb.fault != null»
					public «fbm.name»Fault get«fbm.name»Fault() {
						return this.«fbm.name.toLowerCase»Fault;
					}
					
					public void set«fbm.name»Fault(«fbm.name»Fault «fbm.name.toLowerCase»Fault) {
						this.«fbm.name.toLowerCase»Fault = «fbm.name.toLowerCase»Fault;
					}
				«ENDIF»
				
				«FOR operation : fb.operations»
						«operationTemplate.getContent(operation,invocationContext)»	
				«ENDFOR»
				
			}
		'''
	}
}