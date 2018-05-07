<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
               <title>ejercicio2_1</title>
            </head>
            <body>
         <xsl:apply-templates select="ies"/>
        <xsl:apply-templates select="ciclo"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ies">
        <h1>
           <xsl:value-of select="@nombre"/>
        </h1>
    </xsl:template>
    <xsl:template match="ciclo">
      <p>
          <xsl:value-of select="nombre"/>
      </p>
    </xsl:template>
    
</xsl:stylesheet>
