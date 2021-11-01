<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../../../shared/transforms/shared_constants.xslt"/>

<xsl:variable name="product_long_name">JBoss Fuse 6</xsl:variable>
<xsl:variable name="product_short_name">Fuse 6</xsl:variable>
<xsl:variable name="product_stig_id_name">FUSE_6_STIG</xsl:variable>
<xsl:variable name="prod_type">fuse6</xsl:variable>

<xsl:variable name="cisuri">empty</xsl:variable>
<xsl:variable name="disa-stigs-uri" select="$disa-stigs-apps-appserver-uri"/>

<!-- Define URI for custom policy reference which can be used for linking to corporate policy -->
<!--xsl:variable name="custom-ref-uri">https://www.example.org</xsl:variable-->

</xsl:stylesheet>
