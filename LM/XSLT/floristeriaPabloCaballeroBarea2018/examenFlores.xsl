<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <link href="CSSexamenflores.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <h1 id="principal"><xsl:value-of select="CATALOG/FLORIST/NAME"/></h1>
                <h4><xsl:value-of select="concat(CATALOG/FLORIST/ADDRESS,'-',CATALOG/FLORIST/NUMBER)"/></h4>
                <h3><xsl:value-of select="CATALOG/FLORIST/CITY"/></h3>
                <ol>
                <xsl:for-each-group select="CATALOG/PLANTS/PLANT" group-by="LIGHT">
                    <xsl:sort select="current-grouping-key()" order="descending"/>
                    
                    <li><xsl:value-of select="current-grouping-key()"/></li>
                    <ul>
                        <xsl:for-each select="current-group()">

                            <xsl:sort select="COMMON" order="ascending"></xsl:sort>
                            <li><xsl:apply-templates select="COMMON"/></li>
                        </xsl:for-each>
                        
                    </ul>
                </xsl:for-each-group>
                </ol>
                <h2>Relacion de Plantas(ordenadas por precio)</h2>
                
                <xsl:apply-templates select="CATALOG"></xsl:apply-templates>
            </body>
            
            
            
        </html>
        
        
    </xsl:template>
    <xsl:template match="COMMON">
        <a>
        <xsl:attribute name="href">
            
            <xsl:value-of select="concat('#',current())"/>
        </xsl:attribute>
            <xsl:value-of select="current()"/>
        </a>
    </xsl:template>
    <xsl:template match="CATALOG">
    
        <xsl:for-each-group select="PLANTS/PLANT" group-by="PRICE">
            <xsl:sort select="current-grouping-key()" order="ascending"/>
            
            <xsl:for-each select="current-group()">
                <table border="1">
                    <caption>
                        <xsl:attribute name="id">
                            <xsl:value-of select="COMMON"/>
                        </xsl:attribute>
                        <xsl:value-of select="COMMON"/>
                    </caption>
                    <tr>
                    <td rowspan="14">
                        
                        <xsl:variable name="nomImg" select="concat(COMMON/text(),'.jpg')"/>
                        <xsl:variable name="nombreCurrent" select="BOTANICAL"/>
                        <xsl:variable name="nombre" select='document("diccionario.xml")//planta[nomCientifico=$nombreCurrent]/nomEsp'/>
                        
                        <img> <xsl:attribute name="src"><xsl:value-of select="$nomImg"/></xsl:attribute>
                            <xsl:attribute name="title" ><xsl:value-of select="$nombre"/></xsl:attribute>
                        </img>
                    </td>
                    
                    <xsl:for-each select="current-group()/node()">
                            <tr>
                            <td colspan="1"><xsl:value-of select="name()"/></td>
                            <td colspan="1"><xsl:value-of select="node()"/></td>  
                            </tr>
                    </xsl:for-each>
                    </tr>
                </table>
                <a href="#principal">volver arriba</a>
            </xsl:for-each>
            
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>