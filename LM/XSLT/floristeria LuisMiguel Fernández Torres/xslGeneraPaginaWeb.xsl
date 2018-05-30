<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">

        <html>
            <head>
                <link href="estiloExamen.css" style="text/css" rel="stylesheet"/>
            </head>
            <body>

                <h1 id="inicio">
                    <xsl:value-of select="/CATALOG/FLORIST/NAME"/>
                </h1>
                <br/>
                <h3>
                    <xsl:value-of
                        select="concat(/CATALOG/FLORIST/ADDRESS,' ', /CATALOG/FLORIST/NUMBER)"/>
                </h3>
                <br/>
                <h3>
                    <xsl:value-of select="/CATALOG/FLORIST/CITY"/>
                </h3>
                <ol>
                    <xsl:for-each-group select="/CATALOG/PLANTS/PLANT" group-by="LIGHT">
                        <xsl:sort select="LIGHT" order="descending"/>

                        <li>
                            <xsl:value-of select="current-grouping-key()"/>
                            <ul>
                                <xsl:for-each select="current-group()">
                                    <xsl:sort select="COMMON" order="ascending"/>
                                    <a>

                                        <xsl:attribute name="href">
                                            <xsl:value-of select="concat('#', BOTANICAL)"/>
                                        </xsl:attribute>
                                        <li>

                                            <xsl:value-of select="COMMON"/>
                                        </li>
                                    </a>
                                </xsl:for-each>
                            </ul>
                        </li>

                    </xsl:for-each-group>
                </ol>
                <br/>
                <br/>
                <h2>Relacion de plantas (ordenadas por precio)</h2>
                <xsl:for-each select="//PLANT">
                    <xsl:sort select="PRICE"/>
                    <xsl:variable name="contador" select="count(//PLANT)*2"/>
                    <table border="2" bordercolor="black">
                        <xsl:attribute name="id">
                            <xsl:value-of select="BOTANICAL"/>
                        </xsl:attribute>
                        <caption>
                            <xsl:value-of select="COMMON"/>
                        </caption>
                        <tr>
                            <td>
                                <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$contador"/>
                                </xsl:attribute>
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="concat(COMMON,'.jpg')"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:variable name="planta" select="document('diccionario.xml')//planta[nomCientifico=current()/BOTANICAL]/nomEsp"/>
                                        <xsl:value-of select="$planta"/>
                                    </xsl:attribute>
                                </img>
                            </td>

                            <xsl:for-each select="node()">
                                <tr>
                                <td><xsl:value-of select="local-name()"/></td>
                                <td><xsl:value-of select="node()"/></td>
                                </tr>
                            </xsl:for-each>


                        </tr>
                    </table>
                    <p><a href="#inicio">Ver Arriba</a></p>
                </xsl:for-each>



            </body>


        </html>

    </xsl:template>
</xsl:stylesheet>
