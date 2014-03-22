package com.katzan.spring.furnituretest.util;

import com.ibm.icu.text.Transliterator;

/**
 * Created by Alex on 21.03.14.
 */
public class Translit {

    private static String firstFilter = "Any-Latin; NFD; Lower;";
    private static String secondFilter = "[:Separator:] > '_';";

    public static String getLatinStringWithUnderscore(String source) {
        String tranlitedString="";
        tranlitedString = applyFirstFilter(source);
        tranlitedString = applySecondFilter(tranlitedString);
        return tranlitedString;
    }

    private static String applyFirstFilter(String source) {

        String outString = Transliterator.getInstance(firstFilter)
                .transform(source);
        return outString;
    }

    private static String applySecondFilter(String source) {

        Transliterator transliterator = Transliterator.createFromRules("temp", secondFilter, Transliterator.FORWARD);
        String outString= transliterator.transliterate(source);
        return outString;
    }
}
