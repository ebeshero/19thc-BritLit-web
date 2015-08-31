<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" encoding="utf-8" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">

        <html>
            <head>
                <title><xsl:apply-templates select="//fileDesc//title"/> </title>
                <meta name="Description"
                    content="Supported by the University of Pittsburgh at Greensburg" />
                <meta name="keywords"
                    content="19th century, 19th-century, the nineteenth century, Syllabus, digital scholarship, digital edition, electronic edition, electronic text, humanities computing, electronic editing, Beshero-Bondar" />
               <link rel="stylesheet" type="text/css" href="index.css"/>
               
                


            </head>
            <body>

                <div class="container"><div id="title">
                    <img src="{//div[@type='logo']/head/graphic/@url}" alt="{//div[@type='logo']/head/graphic/desc}"/> <h1><span class="banner"><xsl:apply-templates select="//text/front/div[@type='courseID']/head"/></span></h1>
                    
                    <h2><span class="banner"><xsl:apply-templates select="//text/front/div[@type='courseID']/p/text()"/><xsl:text>: Autumn 2014 Syllabus</xsl:text></span></h2>
                    <hr/>
                    <p class="boilerplate">
                        <span>
                            <strong>Maintained by: </strong> Elisa E. Beshero-Bondar (ebb8 at pitt.edu) <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/3.0/80x15.png"/></a>
                            
                            
                            
   
                        </span>
                        <span><strong>Read the <a href="Fa2014SyllEnglit1175.xml">course description and syllabus in TEI XML</a>.</strong></span>
                        <span>
                            <strong>Last modified: </strong> <xsl:value-of select="current-dateTime()"/> 
                        </span>
                        
                    </p>
                    <hr/>
                </div>
                    
                <div id="main">    
                    <div id="courseInfo">
                        <h3><a href="index.html"> Course Description and Policies</a></h3>
                        
                        <xsl:apply-templates select="//div[@type='meetTimes']"/>
                        
                        
                    
                        
                        <xsl:apply-templates select="//div[@type='advice']"/>
                        
                        
                        <xsl:apply-templates select="//div[@type='abbrev']"/>
                    </div>
                    
                    
               
               <div id="schedule">
                   
          
                   
                 <xsl:apply-templates select="//div[@type='schedule']/div[@type='week']"/>
                   
                  
                   
               
               </div></div>
               
                
                </div>
                <hr/>
               
                    


            </body>
        
        </html>

    </xsl:template>
    
    <xsl:template match="div[@type='week']">
        <xsl:choose> <xsl:when test="@n">
            <!--<tr>
         <td>--><table> 
                
                <tr>   <th><a id="Week{@n}"/><h4><em><xsl:text>Week </xsl:text><xsl:value-of select="@n"/></em></h4></th>
                    <th><h4><em>Readings due</em></h4></th>
                    <th><h4><em>Assignments due</em></h4></th>
                </tr>
                <xsl:apply-templates select="div[@type='day']"/>
            </table><!--</td>
           </tr>-->
            
            
        </xsl:when>
            <xsl:otherwise>
                
                
                <!--<tr><td>--> <table><tr><td><h4><xsl:apply-templates select="div[@type='day']/head/date/text()"/></h4>
                    <xsl:if test="div[@type='day']/head/date/note"><span class="smaller"><xsl:apply-templates select="div[@type='day']/head/date/note"/></span></xsl:if>
                </td>
                    <td><xsl:apply-templates select="div[@type='day']/div[@type='assign']"/></td></tr></table><!--</td>
</tr>-->
                
            </xsl:otherwise>
            
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="div[@type='day'][parent::div/@n]">
        
        <tr> <td><h4><xsl:apply-templates select="head/date/text()"/></h4>
            <xsl:if test="head/date/note"><xsl:text> </xsl:text><span class="smaller"><xsl:apply-templates select="head/date/note"/></span></xsl:if>
        </td>
            
            <td><xsl:apply-templates select="div[@type='inclass']"/></td>
            <td><xsl:apply-templates select="div[@type='assign']"/></td></tr>
        
        
    </xsl:template>
    
    
    
    
    <xsl:template match="div[@style='main']/head">
        <h2><xsl:apply-templates/></h2>
        
    </xsl:template>
    
    <!-- <xsl:template match="body//div[not(@style='main')]/head">
        <h4><xsl:apply-templates/></h4>
        
    </xsl:template>-->
    
    <xsl:template match="list[not(@type='numbered')]">
        <ul>
            <xsl:apply-templates/>
            
        </ul>
        
    </xsl:template>
    
    <xsl:template match="list[@type='numbered']">
        <ol>
            <xsl:apply-templates/>
            
        </ol>
        
    </xsl:template>
    
    <xsl:template match="item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="body//title">
        <span class="italic"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="ref">
        <a href="{@target}"><xsl:apply-templates/></a>
    </xsl:template>
    
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="hi">
        <strong><xsl:apply-templates/></strong>
        
    </xsl:template>
    
    <xsl:template match="note">
        <xsl:text> </xsl:text><span class="smaller"><xsl:apply-templates/></span>
    </xsl:template>
    
  
</xsl:stylesheet>      
   

