<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="//ciclo">
        <xsl:value-of select="nombre"/>
        <!-- <xsl:apply-templates select="//nombre"/> Tambien se puede hacer asi -->
    </xsl:template>
        <!-- 
            <xsl:template match="nombre">
             <xsl:value-of select =".">
             <xsl:template/>
        -->
</xsl:stylesheet>

<!-- apply-templates select lo que hace es 
     buscar la ruta a la que aplicar la plantilla

     y fuera ponemos el template para aplicarle la pantilla al elemento especificado
-->