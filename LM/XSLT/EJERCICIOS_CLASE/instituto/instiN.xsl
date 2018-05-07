<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Mi pagina</title>
                <link href="miestilo.css" rel="stylesheet" />
            </head>
            <body>
       <xsl:apply-templates select="//nombre"/> 
        <xsl:apply-templates select="//imagen"/>
            </body>
        </html>  
    </xsl:template>
    <xsl:template match="nombre">
     <p>   <xsl:value-of select="."/> </p>
    </xsl:template>
    <xsl:template match="imagen">
       <img>
           <xsl:attribute name="src">
               <xsl:value-of select="."/>
           </xsl:attribute>
           <xsl:attribute name="class">
            <xsl:text>img1</xsl:text>
           </xsl:attribute>
                      
       </img>
    </xsl:template>
</xsl:stylesheet>