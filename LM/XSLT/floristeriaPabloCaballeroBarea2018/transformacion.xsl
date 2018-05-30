<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        
        <xsl:element name="catalogo">
            
                <xsl:for-each-group select="CATALOG/PLANTS/PLANT" group-by="LIGHT">
                    <xsl:element name="grupo">
                    <xsl:attribute name="nombre"><xsl:value-of select="current-grouping-key()"/></xsl:attribute>
                    <xsl:attribute name="cant_especies"><xsl:value-of select="count(current-group())"/></xsl:attribute>
                        <xsl:for-each select="current-group()">
                            <xsl:element name="planta">
                                <xsl:element name="nomCientifico">
                                    <xsl:value-of select="BOTANICAL"/>
                                </xsl:element>
                                <xsl:element name="nomEsp">
                                    <xsl:value-of select="concat('ESP',COMMON)"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:for-each>
                        
 
                    </xsl:element>
                </xsl:for-each-group>
            
            
        </xsl:element>
        
        
        
    </xsl:template>
</xsl:stylesheet>