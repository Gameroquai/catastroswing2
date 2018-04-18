<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <tittle>Elecciones Generales <xsl:value-of select="//convocatoria"/></tittle>
            <head></head>
            <body><xsl:apply-templates select="escrutinio_sitio/resultados/partido"></xsl:apply-templates> </body>

        </html>
    </xsl:template>
    <xsl:template name="partido">
        <table border="1">
            <caption>RESULTADOS</caption>
            <th>ID PARTIDO</th>
            <th>NOMBRE</th>
            <th>ELECTOS</th>
            <th>NUMERO DE VOTOS</th>
            <xsl:apply-templates select="escrutinio_sitio/resultados/partido"></xsl:apply-templates>
        </table>
    </xsl:template>
    
    </xsl:stylesheet>
