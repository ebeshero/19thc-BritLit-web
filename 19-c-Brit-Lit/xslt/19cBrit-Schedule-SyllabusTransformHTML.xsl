<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" doctype-system="about:legacy-compat"/> 
    <!--<xsl:strip-space elements="*"/>-->
    <xsl:template match="/">

        <html>
            <head>
                <title><xsl:apply-templates select="//fileDesc//title"/> </title>
                <meta name="Description"
                    content="Supported by the University of Pittsburgh at Greensburg" />
                <meta name="keywords"
                    content="19th century, 19th-century, the nineteenth century, Syllabus, digital scholarship, digital edition, electronic edition, electronic text, humanities computing, electronic editing, Beshero-Bondar" />
               <link rel="stylesheet" type="text/css" href="index.css"/>
                <script type="text/javascript" src="jumpingDateLinks.js">//</script>
                


            </head>
            <body>
                
                <xsl:comment>#include virtual="top.html" </xsl:comment>

               
                    <h1><span class="banner"><xsl:apply-templates select="//text/front/div[@type='courseID']/head"/></span></h1>
                    
                    <h2><span class="banner"><xsl:apply-templates select="//text/front/div[@type='courseID']/p/text()"/><xsl:text>: Syllabus</xsl:text></span></h2>
                    
                    
                <div id="main">    
                   <div id="heading"> 
                       <div id="courseInfo">
                        <h3><a href="index.html"> Course Description and Policies</a></h3>
                        
                        <xsl:apply-templates select="//div[@type='meetTimes']"/>
                        <p><strong><a id="dateRef">Jump Down to the Schedule</a></strong></p>
                        
                        
                        
                    
                        
                        <xsl:apply-templates select="//div[@type='advice']"/>
                        
                        
                        <xsl:apply-templates select="//div[@type='abbrev']"/>
                    </div>
                       <div id="picture">
                           <img id="frontis" src="SongsInnocenceTP.jpg" alt="an illustration of Laura paying the goblins with a golden curl, made by Dante Gabriel Rossetti for Christina Rossetti's Goblin Market"/>
                       </div>
                   
                   </div>
                    
                    
               
               <div id="schedule">
                   
          
                   
                 <xsl:apply-templates select="//div[@type='schedule']/table[@type='week']"/>
                   
                  
                   
               
               </div></div>
               
                
              
                <hr/>
               
                    


            </body>
        
        </html>

    </xsl:template>
    
    <xsl:template match="table[@type='week']">
        <xsl:choose> <xsl:when test="@n">
            <!--<tr>
         <td>--><table> 
                
                <tr>   <th id="Week{@n}"><h4><em><xsl:text>Week </xsl:text><xsl:value-of select="@n"/></em></h4></th>
                    <th><h4><em>Readings due</em></h4></th>
                    <th><h4><em>Assignments due</em></h4></th>
                </tr>
                <xsl:apply-templates select="row[@role='day']"/>
            </table><!--</td>
           </tr>-->
            
            
        </xsl:when>
            <xsl:otherwise>
                
                
                <!--<tr><td>--> <table><tr><td><h4><xsl:apply-templates select="row[@role='day']//date/text()"/></h4>
                    <xsl:if test="row[@role='day']//date/note"><span class="smaller"><xsl:apply-templates select="row[@role='day']//date/note"/></span></xsl:if>
                </td>
                    <td><xsl:apply-templates select="row[@role='day']/cell[@role='assign']"/></td></tr></table><!--</td>
</tr>-->
                
            </xsl:otherwise>
            
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="row[@role='day'][parent::table/@n]">
        
        <tr id="d{descendant::date/@when}"> <td><h4><xsl:apply-templates select="descendant::date/text()"/></h4>
            <xsl:if test="descendant::date/note"><xsl:text> </xsl:text><span class="smaller"><xsl:apply-templates select="descendant::date/note"/></span></xsl:if>
        </td>
            
            <td><xsl:apply-templates select="cell[@role='inclass']"/></td>
            <td><xsl:apply-templates select="cell[@role='assign']"/></td></tr>
        
        
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
    
    <!--<xsl:template match="body//title">
        <span class="italic"><xsl:apply-templates/></span>
    </xsl:template>-->
    
    <xsl:template match="ref">
        <a href="{@target}" target="_blank"><xsl:apply-templates/></a>
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
    
    
    <xsl:template match="body//title[not(@level)] | body//title[@level='m']">
        <cite><xsl:apply-templates/></cite>
        
    </xsl:template>
    
    <xsl:template match="body//title[@level='a']">
        <cite class="sub"><xsl:apply-templates/></cite>
        
    </xsl:template>
    <xsl:template match="q">
        <q><xsl:apply-templates/></q>
    </xsl:template>
    
  
</xsl:stylesheet>

