<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:template match="/">
    <xsl:apply-templates select="municipales"/>
    </xsl:template>
    
    <xsl:template match="escrutinio_sitio">
        <h1>Resultado de las elecciones Municipales en: <xsl:value-of select="nombre_sitio"/></h1>
        <table border="1">
            <tr>
                <th></th>
                <th>Votos</th>
                <th>Abtenciones</th>
                <th>Nulos</th>
                <th>Blancos</th>
            </tr>
            <tr><td>Cantidad</td><td><xsl:value-of select="votos/contabilizados/cantidad"/></td><td><xsl:value-of select="votos/abstenciones/cantidad   "/></td></tr>
            <tr><td>Porcentaje</td><td><xsl:value-of select="votos/contabilizados/porcentaje"/></td></tr>
        </table>
    </xsl:template>
</xsl:stylesheet>