<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="iso-8859-1" version="1.0"/>
    <xsl:template match="antologia">
        <html>
            <body>
                <h1>Antología</h1>
                <p>
                    <xsl:call-template name="titulo"/>
                    <xsl:call-template name="nombre"/>
                </p>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="titulo">
        <br/>
        Título: <xsl:apply-templates select="poema/titulo"/>
    </xsl:template>
    <xsl:template match="titulo">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    <xsl:template name="nombre">
        <br/>
        Autor: <xsl:apply-templates select="poema/autor/nombre | poema/autor/apellido"/>
    </xsl:template>
    <xsl:template match="titulo">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    <xsl:template match="nombre">
        <br/>
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="apellido">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>