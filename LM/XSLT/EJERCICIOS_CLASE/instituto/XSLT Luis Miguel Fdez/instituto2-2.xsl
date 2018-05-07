<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <h1><xsl:value-of select="ies/@nombre"/></h1>
        <p> Pagina web : 
            <a>
                <xsl:attribute name="href" select="ies/@web"></xsl:attribute>
                <!-- Lo que hace este atributo es asignarle un atributo a la etiqueta <a> -->
                <xsl:value-of select="ies/@web"/>
            </a>
        </p>
        <ul>
            <xsl:apply-templates select="//ciclo"/>
        </ul>
        
    </xsl:template>
    
    <xsl:template match="//ciclo">
        <li><xsl:value-of select="nombre"/></li>
    </xsl:template>
    
</xsl:stylesheet>