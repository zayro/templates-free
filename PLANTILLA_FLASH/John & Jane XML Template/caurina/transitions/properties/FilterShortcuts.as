class caurina.transitions.properties.FilterShortcuts
{
    function FilterShortcuts()
    {
        trace ("This is an static class and should not be instantiated.");
    } // End of the function
    static function init()
    {
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_filter", caurina.transitions.properties.FilterShortcuts._filter_splitter);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_angle", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "angle"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_blurX", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "blurX"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_blurY", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "blurY"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_distance", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "distance"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_highlightAlpha", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "highlightAlpha"]);
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_Bevel_highlightColor", caurina.transitions.properties.FilterShortcuts._generic_color_splitter, ["_Bevel_highlightColor_r", "_Bevel_highlightColor_g", "_Bevel_highlightColor_b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_highlightColor_r", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "highlightColor", "color", "r"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_highlightColor_g", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "highlightColor", "color", "g"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_highlightColor_b", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "highlightColor", "color", "b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_knockout", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "knockout"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_quality", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "quality"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_shadowAlpha", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "shadowAlpha"]);
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_Bevel_shadowColor", caurina.transitions.properties.FilterShortcuts._generic_color_splitter, ["_Bevel_shadowColor_r", "_Bevel_shadowColor_g", "_Bevel_shadowColor_b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_shadowColor_r", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "shadowColor", "color", "r"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_shadowColor_g", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "shadowColor", "color", "g"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_shadowColor_b", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "shadowColor", "color", "b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_strength", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "strength"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Bevel_type", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BevelFilter, "type"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Blur_blurX", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BlurFilter, "blurX"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Blur_blurY", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BlurFilter, "blurY"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Blur_quality", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.BlurFilter, "quality"]);
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_ColorMatrix_matrix", caurina.transitions.properties.FilterShortcuts._generic_matrix_splitter, [[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0], ["_ColorMatrix_matrix_rr", "_ColorMatrix_matrix_rg", "_ColorMatrix_matrix_rb", "_ColorMatrix_matrix_ra", "_ColorMatrix_matrix_ro", "_ColorMatrix_matrix_gr", "_ColorMatrix_matrix_gg", "_ColorMatrix_matrix_gb", "_ColorMatrix_matrix_ga", "_ColorMatrix_matrix_go", "_ColorMatrix_matrix_br", "_ColorMatrix_matrix_bg", "_ColorMatrix_matrix_bb", "_ColorMatrix_matrix_ba", "_ColorMatrix_matrix_bo", "_ColorMatrix_matrix_ar", "_ColorMatrix_matrix_ag", "_ColorMatrix_matrix_ab", "_ColorMatrix_matrix_aa", "_ColorMatrix_matrix_ao"]]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_rr", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 0]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_rg", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 1]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_rb", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 2]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ra", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 3]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ro", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 4]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_gr", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 5]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_gg", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 6]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_gb", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 7]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ga", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 8]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_go", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 9]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_br", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 10]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_bg", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 11]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_bb", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 12]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ba", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 13]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_bo", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 14]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ar", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 15]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ag", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 16]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ab", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 17]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_aa", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 18]);
        caurina.transitions.Tweener.registerSpecialProperty("_ColorMatrix_matrix_ao", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ColorMatrixFilter, "matrix", "matrix", 19]);
        caurina.transitions.Tweener.registerSpecialProperty("_Convolution_alpha", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ConvolutionFilter, "alpha"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Convolution_bias", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ConvolutionFilter, "bias"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Convolution_clamp", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ConvolutionFilter, "clamp"]);
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_Convolution_color", caurina.transitions.properties.FilterShortcuts._generic_color_splitter, ["_Convolution_color_r", "_Convolution_color_g", "_Convolution_color_b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Convolution_color_r", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ConvolutionFilter, "color", "color", "r"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Convolution_color_g", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ConvolutionFilter, "color", "color", "g"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Convolution_color_b", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ConvolutionFilter, "color", "color", "b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Convolution_divisor", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ConvolutionFilter, "divisor"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Convolution_matrixX", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ConvolutionFilter, "matrixX"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Convolution_matrixY", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ConvolutionFilter, "matrixY"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Convolution_preserveAlpha", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.ConvolutionFilter, "preserveAlpha"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_alpha", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "alpha"]);
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_DisplacementMap_color", caurina.transitions.properties.FilterShortcuts._generic_color_splitter, ["_DisplacementMap_color_r", "_DisplacementMap_color_r", "_DisplacementMap_color_r"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_color_r", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "color", "color", "r"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_color_g", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "color", "color", "g"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_color_b", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "color", "color", "b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_componentX", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "componentX"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_componentY", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "componentY"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_mapBitmap", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "mapBitmap"]);
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_DisplacementMap_mapPoint", caurina.transitions.properties.FilterShortcuts._generic_point_splitter, ["_DisplacementMap_mapPoint_x", "_DisplacementMap_mapPoint_y"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_mapPoint_x", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "mapPoint", "point", "x"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_mapPoint_y", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "mapPoint", "point", "y"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_mode", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "mode"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_scaleX", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "scaleX"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DisplacementMap_scaleY", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DisplacementMapFilter, "scaleY"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_alpha", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "alpha"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_angle", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "angle"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_blurX", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "blurX"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_blurY", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "blurY"]);
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_DropShadow_color", caurina.transitions.properties.FilterShortcuts._generic_color_splitter, ["_DropShadow_color_r", "_DropShadow_color_g", "_DropShadow_color_b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_color_r", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "color", "color", "r"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_color_g", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "color", "color", "g"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_color_b", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "color", "color", "b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_distance", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "distance"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_hideObject", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "hideObject"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_inner", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "inner"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_knockout", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "knockout"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_quality", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "quality"]);
        caurina.transitions.Tweener.registerSpecialProperty("_DropShadow_strength", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.DropShadowFilter, "strength"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Glow_alpha", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GlowFilter, "alpha"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Glow_blurX", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GlowFilter, "blurX"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Glow_blurY", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GlowFilter, "blurY"]);
        caurina.transitions.Tweener.registerSpecialPropertySplitter("_Glow_color", caurina.transitions.properties.FilterShortcuts._generic_color_splitter, ["_Glow_color_r", "_Glow_color_g", "_Glow_color_b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Glow_color_r", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GlowFilter, "color", "color", "r"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Glow_color_g", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GlowFilter, "color", "color", "g"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Glow_color_b", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GlowFilter, "color", "color", "b"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Glow_inner", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GlowFilter, "inner"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Glow_knockout", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GlowFilter, "knockout"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Glow_quality", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GlowFilter, "quality"]);
        caurina.transitions.Tweener.registerSpecialProperty("_Glow_strength", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GlowFilter, "strength"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_angle", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientBevelFilter, "angle"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_blurX", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientBevelFilter, "blurX"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_blurY", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientBevelFilter, "blurY"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_distance", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientBevelFilter, "distance"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_quality", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientBevelFilter, "quality"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_strength", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientBevelFilter, "strength"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientBevel_type", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientBevelFilter, "type"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_angle", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientGlowFilter, "angle"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_blurX", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientGlowFilter, "blurX"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_blurY", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientGlowFilter, "blurY"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_distance", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientGlowFilter, "distance"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_knockout", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientGlowFilter, "knockout"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_quality", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientGlowFilter, "quality"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_strength", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientGlowFilter, "strength"]);
        caurina.transitions.Tweener.registerSpecialProperty("_GradientGlow_type", caurina.transitions.properties.FilterShortcuts._filter_property_get, caurina.transitions.properties.FilterShortcuts._filter_property_set, [flash.filters.GradientGlowFilter, "type"]);
    } // End of the function
    static function _generic_color_splitter(p_value, p_parameters)
    {
        var _loc1 = new Array();
        _loc1.push({name: p_parameters[0], value: caurina.transitions.AuxFunctions.numberToR(p_value)});
        _loc1.push({name: p_parameters[1], value: caurina.transitions.AuxFunctions.numberToG(p_value)});
        _loc1.push({name: p_parameters[2], value: caurina.transitions.AuxFunctions.numberToB(p_value)});
        return (_loc1);
    } // End of the function
    static function _generic_point_splitter(p_value, p_parameters)
    {
        var _loc1 = new Array();
        _loc1.push({name: p_parameters[0], value: p_value.x});
        _loc1.push({name: p_parameters[1], value: p_value.y});
        return (_loc1);
    } // End of the function
    static function _generic_matrix_splitter(p_value, p_parameters)
    {
        if (p_value == null)
        {
            p_value = p_parameters[0].concat();
        } // end if
        var _loc5 = new Array();
        for (var _loc1 = 0; _loc1 < p_value.length; ++_loc1)
        {
            _loc5.push({name: p_parameters[1][_loc1], value: p_value[_loc1]});
        } // end of for
        return (_loc5);
    } // End of the function
    static function _filter_splitter(p_value)
    {
        var _loc2 = new Array();
        if (p_value instanceof flash.filters.BevelFilter)
        {
            _loc2.push({name: "_Bevel_angle", value: (flash.filters.BevelFilter)(p_value).angle});
            _loc2.push({name: "_Bevel_blurX", value: (flash.filters.BevelFilter)(p_value).blurX});
            _loc2.push({name: "_Bevel_blurY", value: (flash.filters.BevelFilter)(p_value).blurY});
            _loc2.push({name: "_Bevel_distance", value: (flash.filters.BevelFilter)(p_value).distance});
            _loc2.push({name: "_Bevel_highlightAlpha", value: (flash.filters.BevelFilter)(p_value).highlightAlpha});
            _loc2.push({name: "_Bevel_highlightColor", value: (flash.filters.BevelFilter)(p_value).highlightColor});
            _loc2.push({name: "_Bevel_knockout", value: (flash.filters.BevelFilter)(p_value).knockout});
            _loc2.push({name: "_Bevel_quality", value: (flash.filters.BevelFilter)(p_value).quality});
            _loc2.push({name: "_Bevel_shadowAlpha", value: (flash.filters.BevelFilter)(p_value).shadowAlpha});
            _loc2.push({name: "_Bevel_shadowColor", value: (flash.filters.BevelFilter)(p_value).shadowColor});
            _loc2.push({name: "_Bevel_strength", value: (flash.filters.BevelFilter)(p_value).strength});
            _loc2.push({name: "_Bevel_type", value: (flash.filters.BevelFilter)(p_value).type});
        }
        else if (p_value instanceof flash.filters.BlurFilter)
        {
            _loc2.push({name: "_Blur_blurX", value: (flash.filters.BlurFilter)(p_value).blurX});
            _loc2.push({name: "_Blur_blurY", value: (flash.filters.BlurFilter)(p_value).blurY});
            _loc2.push({name: "_Blur_quality", value: (flash.filters.BlurFilter)(p_value).quality});
        }
        else if (p_value instanceof flash.filters.ColorMatrixFilter)
        {
            _loc2.push({name: "_ColorMatrix_matrix", value: (flash.filters.ColorMatrixFilter)(p_value).matrix});
        }
        else if (p_value instanceof flash.filters.ConvolutionFilter)
        {
            _loc2.push({name: "_Convolution_alpha", value: (flash.filters.ConvolutionFilter)(p_value).alpha});
            _loc2.push({name: "_Convolution_bias", value: (flash.filters.ConvolutionFilter)(p_value).bias});
            _loc2.push({name: "_Convolution_clamp", value: (flash.filters.ConvolutionFilter)(p_value).clamp});
            _loc2.push({name: "_Convolution_color", value: (flash.filters.ConvolutionFilter)(p_value).color});
            _loc2.push({name: "_Convolution_divisor", value: (flash.filters.ConvolutionFilter)(p_value).divisor});
            _loc2.push({name: "_Convolution_matrixX", value: (flash.filters.ConvolutionFilter)(p_value).matrixX});
            _loc2.push({name: "_Convolution_matrixY", value: (flash.filters.ConvolutionFilter)(p_value).matrixY});
            _loc2.push({name: "_Convolution_preserveAlpha", value: (flash.filters.ConvolutionFilter)(p_value).preserveAlpha});
        }
        else if (p_value instanceof flash.filters.DisplacementMapFilter)
        {
            _loc2.push({name: "_DisplacementMap_alpha", value: (flash.filters.DisplacementMapFilter)(p_value).alpha});
            _loc2.push({name: "_DisplacementMap_color", value: (flash.filters.DisplacementMapFilter)(p_value).color});
            _loc2.push({name: "_DisplacementMap_componentX", value: (flash.filters.DisplacementMapFilter)(p_value).componentX});
            _loc2.push({name: "_DisplacementMap_componentY", value: (flash.filters.DisplacementMapFilter)(p_value).componentY});
            _loc2.push({name: "_DisplacementMap_mapBitmap", value: (flash.filters.DisplacementMapFilter)(p_value).mapBitmap});
            _loc2.push({name: "_DisplacementMap_mapPoint", value: (flash.filters.DisplacementMapFilter)(p_value).mapPoint});
            _loc2.push({name: "_DisplacementMap_mode", value: (flash.filters.DisplacementMapFilter)(p_value).mode});
            _loc2.push({name: "_DisplacementMap_scaleX", value: (flash.filters.DisplacementMapFilter)(p_value).scaleX});
            _loc2.push({name: "_DisplacementMap_scaleY", value: (flash.filters.DisplacementMapFilter)(p_value).scaleY});
        }
        else if (p_value instanceof flash.filters.DropShadowFilter)
        {
            _loc2.push({name: "_DropShadow_alpha", value: (flash.filters.DropShadowFilter)(p_value).alpha});
            _loc2.push({name: "_DropShadow_angle", value: (flash.filters.DropShadowFilter)(p_value).angle});
            _loc2.push({name: "_DropShadow_blurX", value: (flash.filters.DropShadowFilter)(p_value).blurX});
            _loc2.push({name: "_DropShadow_blurY", value: (flash.filters.DropShadowFilter)(p_value).blurY});
            _loc2.push({name: "_DropShadow_color", value: (flash.filters.DropShadowFilter)(p_value).color});
            _loc2.push({name: "_DropShadow_distance", value: (flash.filters.DropShadowFilter)(p_value).distance});
            _loc2.push({name: "_DropShadow_hideObject", value: (flash.filters.DropShadowFilter)(p_value).hideObject});
            _loc2.push({name: "_DropShadow_inner", value: (flash.filters.DropShadowFilter)(p_value).inner});
            _loc2.push({name: "_DropShadow_knockout", value: (flash.filters.DropShadowFilter)(p_value).knockout});
            _loc2.push({name: "_DropShadow_quality", value: (flash.filters.DropShadowFilter)(p_value).quality});
            _loc2.push({name: "_DropShadow_strength", value: (flash.filters.DropShadowFilter)(p_value).strength});
        }
        else if (p_value instanceof flash.filters.GlowFilter)
        {
            _loc2.push({name: "_Glow_alpha", value: (flash.filters.GlowFilter)(p_value).alpha});
            _loc2.push({name: "_Glow_blurX", value: (flash.filters.GlowFilter)(p_value).blurX});
            _loc2.push({name: "_Glow_blurY", value: (flash.filters.GlowFilter)(p_value).blurY});
            _loc2.push({name: "_Glow_color", value: (flash.filters.GlowFilter)(p_value).color});
            _loc2.push({name: "_Glow_inner", value: (flash.filters.GlowFilter)(p_value).inner});
            _loc2.push({name: "_Glow_knockout", value: (flash.filters.GlowFilter)(p_value).knockout});
            _loc2.push({name: "_Glow_quality", value: (flash.filters.GlowFilter)(p_value).quality});
            _loc2.push({name: "_Glow_strength", value: (flash.filters.GlowFilter)(p_value).strength});
        }
        else if (p_value instanceof flash.filters.GradientBevelFilter)
        {
            _loc2.push({name: "_GradientBevel_angle", value: (flash.filters.GradientBevelFilter)(p_value).strength});
            _loc2.push({name: "_GradientBevel_blurX", value: (flash.filters.GradientBevelFilter)(p_value).blurX});
            _loc2.push({name: "_GradientBevel_blurY", value: (flash.filters.GradientBevelFilter)(p_value).blurY});
            _loc2.push({name: "_GradientBevel_distance", value: (flash.filters.GradientBevelFilter)(p_value).distance});
            _loc2.push({name: "_GradientBevel_quality", value: (flash.filters.GradientBevelFilter)(p_value).quality});
            _loc2.push({name: "_GradientBevel_strength", value: (flash.filters.GradientBevelFilter)(p_value).strength});
            _loc2.push({name: "_GradientBevel_type", value: (flash.filters.GradientBevelFilter)(p_value).type});
        }
        else if (p_value instanceof flash.filters.GradientGlowFilter)
        {
            _loc2.push({name: "_GradientGlow_angle", value: (flash.filters.GradientGlowFilter)(p_value).strength});
            _loc2.push({name: "_GradientGlow_blurX", value: (flash.filters.GradientGlowFilter)(p_value).blurX});
            _loc2.push({name: "_GradientGlow_blurY", value: (flash.filters.GradientGlowFilter)(p_value).blurY});
            _loc2.push({name: "_GradientGlow_distance", value: (flash.filters.GradientGlowFilter)(p_value).distance});
            _loc2.push({name: "_GradientGlow_knockout", value: (flash.filters.GradientGlowFilter)(p_value).knockout});
            _loc2.push({name: "_GradientGlow_quality", value: (flash.filters.GradientGlowFilter)(p_value).quality});
            _loc2.push({name: "_GradientGlow_strength", value: (flash.filters.GradientGlowFilter)(p_value).strength});
            _loc2.push({name: "_GradientGlow_type", value: (flash.filters.GradientGlowFilter)(p_value).type});
        }
        else
        {
            trace ("Tweener FilterShortcuts Error :: Unknown filter class used");
        } // end else if
        return (_loc2);
    } // End of the function
    static function _filter_property_get(p_obj, p_parameters)
    {
        var _loc2 = p_obj.filters;
        var _loc1;
        var _loc8 = p_parameters[0];
        var _loc3 = p_parameters[1];
        var _loc6 = p_parameters[2];
        for (var _loc1 = 0; _loc1 < _loc2.length; ++_loc1)
        {
            if (_loc2[_loc1] instanceof _loc8)
            {
                if (_loc6 == "color")
                {
                    var _loc4 = p_parameters[3];
                    if (_loc4 == "r")
                    {
                        return (caurina.transitions.AuxFunctions.numberToR(_loc2[_loc1][_loc3]));
                    } // end if
                    if (_loc4 == "g")
                    {
                        return (caurina.transitions.AuxFunctions.numberToG(_loc2[_loc1][_loc3]));
                    } // end if
                    if (_loc4 == "b")
                    {
                        return (caurina.transitions.AuxFunctions.numberToB(_loc2[_loc1][_loc3]));
                    } // end if
                    continue;
                } // end if
                if (_loc6 == "matrix")
                {
                    return (_loc2[_loc1][_loc3][p_parameters[3]]);
                    continue;
                } // end if
                if (_loc6 == "point")
                {
                    return (_loc2[_loc1][_loc3][p_parameters[3]]);
                    continue;
                } // end if
                return (_loc2[_loc1][_loc3]);
            } // end if
        } // end of for
        var _loc7;
        switch (_loc8)
        {
            case flash.filters.BevelFilter:
            {
                _loc7 = {angle: NaN, blurX: 0, blurY: 0, distance: 0, highlightAlpha: 1, highlightColor: NaN, knockout: null, quality: NaN, shadowAlpha: 1, shadowColor: NaN, strength: 2, type: null};
                break;
            } 
            case flash.filters.BlurFilter:
            {
                _loc7 = {blurX: 0, blurY: 0, quality: NaN};
                break;
            } 
            case flash.filters.ColorMatrixFilter:
            {
                _loc7 = {matrix: [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]};
                break;
            } 
            case flash.filters.ConvolutionFilter:
            {
                _loc7 = {alpha: 0, bias: 0, clamp: null, color: NaN, divisor: 1, matrix: [1], matrixX: 1, matrixY: 1, preserveAlpha: null};
                break;
            } 
            case flash.filters.DisplacementMapFilter:
            {
                _loc7 = {alpha: 0, color: NaN, componentX: null, componentY: null, mapBitmap: null, mapPoint: null, mode: null, scaleX: 0, scaleY: 0};
                break;
            } 
            case flash.filters.DropShadowFilter:
            {
                _loc7 = {distance: 0, angle: NaN, color: NaN, alpha: 1, blurX: 0, blurY: 0, strength: 1, quality: NaN, inner: null, knockout: null, hideObject: null};
                break;
            } 
            case flash.filters.GlowFilter:
            {
                _loc7 = {alpha: 1, blurX: 0, blurY: 0, color: NaN, inner: null, knockout: null, quality: NaN, strength: 2};
                break;
            } 
            case flash.filters.GradientBevelFilter:
            {
                _loc7 = {alphas: null, angle: NaN, blurX: 0, blurY: 0, colors: null, distance: 0, knockout: null, quality: NaN, ratios: NaN, strength: 1, type: null};
                break;
            } 
            case flash.filters.GradientGlowFilter:
            {
                _loc7 = {alphas: null, angle: NaN, blurX: 0, blurY: 0, colors: null, distance: 0, knockout: null, quality: NaN, ratios: NaN, strength: 1, type: null};
                break;
            } 
        } // End of switch
        if (_loc6 == "color")
        {
            return (NaN);
        }
        else if (_loc6 == "matrix")
        {
            return (_loc7[_loc3][p_parameters[3]]);
        }
        else if (_loc6 == "point")
        {
            return (_loc7[_loc3][p_parameters[3]]);
        }
        else
        {
            return (_loc7[_loc3]);
        } // end else if
    } // End of the function
    static function _filter_property_set(p_obj, p_value, p_parameters)
    {
        var _loc2 = p_obj.filters;
        var _loc1;
        var _loc12 = p_parameters[0];
        var _loc3 = p_parameters[1];
        var _loc9 = p_parameters[2];
        for (var _loc1 = 0; _loc1 < _loc2.length; ++_loc1)
        {
            if (_loc2[_loc1] instanceof _loc12)
            {
                if (_loc9 == "color")
                {
                    var _loc5 = p_parameters[3];
                    if (_loc5 == "r")
                    {
                        _loc2[_loc1][_loc3] = _loc2[_loc1][_loc3] & 65535 | p_value << 16;
                    } // end if
                    if (_loc5 == "g")
                    {
                        _loc2[_loc1][_loc3] = _loc2[_loc1][_loc3] & 16711935 | p_value << 8;
                    } // end if
                    if (_loc5 == "b")
                    {
                        _loc2[_loc1][_loc3] = _loc2[_loc1][_loc3] & 16776960 | p_value;
                    } // end if
                }
                else if (_loc9 == "matrix")
                {
                    var _loc6 = _loc2[_loc1][_loc3];
                    _loc6[p_parameters[3]] = p_value;
                    _loc2[_loc1][_loc3] = _loc6;
                }
                else if (_loc9 == "point")
                {
                    var _loc7 = (flash.geom.Point)(_loc2[_loc1][_loc3]);
                    _loc7[p_parameters[3]] = p_value;
                    _loc2[_loc1][_loc3] = _loc7;
                }
                else
                {
                    _loc2[_loc1][_loc3] = p_value;
                } // end else if
                p_obj.filters = _loc2;
                return;
            } // end if
        } // end of for
        if (_loc2 == undefined)
        {
            _loc2 = new Array();
        } // end if
        var _loc10;
        switch (_loc12)
        {
            case flash.filters.BevelFilter:
            {
                _loc10 = new flash.filters.BevelFilter(0, 45, 16777215, 1, 0, 1, 0, 0);
                break;
            } 
            case flash.filters.BlurFilter:
            {
                _loc10 = new flash.filters.BlurFilter(0, 0);
                break;
            } 
            case flash.filters.ColorMatrixFilter:
            {
                _loc10 = new flash.filters.ColorMatrixFilter([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]);
                break;
            } 
            case flash.filters.ConvolutionFilter:
            {
                _loc10 = new flash.filters.ConvolutionFilter(1, 1, [1], 1, 0, true, true, 0, 0);
                break;
            } 
            case flash.filters.DisplacementMapFilter:
            {
                _loc10 = new flash.filters.DisplacementMapFilter(new flash.display.BitmapData(10, 10), new flash.geom.Point(0, 0), 0, 1, 0, 0);
                break;
            } 
            case flash.filters.DropShadowFilter:
            {
                _loc10 = new flash.filters.DropShadowFilter(0, 45, 0, 1, 0, 0);
                break;
            } 
            case flash.filters.GlowFilter:
            {
                _loc10 = new flash.filters.GlowFilter(16711680, 1, 0, 0);
                break;
            } 
            case flash.filters.GradientBevelFilter:
            {
                _loc10 = new flash.filters.GradientBevelFilter(0, 45, [16777215, 0], [1, 1], [32, 223], 0, 0);
                break;
            } 
            case flash.filters.GradientGlowFilter:
            {
                _loc10 = new flash.filters.GradientGlowFilter(0, 45, [16777215, 0], [1, 1], [32, 223], 0, 0);
                break;
            } 
        } // End of switch
        _loc2.push(_loc10);
        p_obj.filters = _loc2;
        caurina.transitions.properties.FilterShortcuts._filter_property_set(p_obj, p_value, p_parameters);
    } // End of the function
} // End of Class
