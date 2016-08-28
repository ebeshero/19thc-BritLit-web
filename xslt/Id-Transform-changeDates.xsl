<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.tei-c.org/ns/1.0" version="3.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!--ebb: A stylesheet to update the dates in a syllabus file from another current syllabus XML file in my collection.-->
    <xsl:variable name="upToDate" select="document('dhCDA-2016.xml')" as="document-node()"/> 
    
    <xsl:template match="head/date[@when]">
           <date when="{$upToDate//head/date[count(preceding::head/date) = current()/count(preceding::head/date)]/@when}">
            <xsl:value-of select="$upToDate//head/date[count(preceding::head/date) = current()/count(preceding::head/date)]"/>
        </date>
    </xsl:template>
    
   <!--Use this to add or change week numbers.
       <xsl:template match="div[@type='week']">
        
        <div type="week" n="{count(preceding-sibling::div[@type='week']) + 1}"><xsl:apply-templates/></div>
    </xsl:template>
   -->
   
    
</xsl:stylesheet>
    
