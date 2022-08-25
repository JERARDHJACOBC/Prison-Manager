/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.PrisonManager;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Currency;
import java.util.Locale;

public class LocaleTest {

    static public void customFormat(String pattern, double value) {
        DecimalFormat myFormatter = new DecimalFormat(pattern);
        String output = myFormatter.format(value);
        System.out.println(
                "customFormat: " + value + " " + pattern + " " + output);
    }

    static public void localizedFormat(
            String pattern,
            double value,
            Locale locale) {
        NumberFormat nf = NumberFormat.getNumberInstance(locale);
        DecimalFormat df = (DecimalFormat) nf;
        df.applyPattern(pattern);
        String output = df.format(value);
        System.out.println(
                "localizedFormat: " + pattern + " " + output + " " + locale.toString());
    }

    static public void main(String[] args) throws Exception {
        customFormat("###,###.###", 123456.789);
        customFormat("###.##", 123456.789);
        customFormat("000000.000", 123.78);
        customFormat("$###,###.###", 12345.67);
        customFormat("\u00a5###,###.###", 12345.67);
        Locale currentLocale = new Locale("hi", "US");
        DecimalFormatSymbols unusualSymbols =
                new DecimalFormatSymbols(currentLocale);
        unusualSymbols.setDecimalSeparator('|');
        unusualSymbols.setGroupingSeparator('^');
        String strange = "#,##0.###";
        DecimalFormat weirdFormatter =
                new DecimalFormat(strange, unusualSymbols);
        weirdFormatter.setGroupingSize(4);
        String bizarre = weirdFormatter.format(12345.678);
        System.out.println(bizarre);
        Locale[] locales =
                {
            new Locale("hi", "IN"),
            new Locale("en", "US"),
            new Locale("de", "DE"),
            new Locale("fr", "FR")
        };
        for (int i = 0; i < locales.length; i++) {
            localizedFormat("###,###.###", 123456.789, locales[i]);
        }
        /** Using the Currency class in J2SE 1.4, we now have the tools to print a 
        EUR currency value 
         * using a fr_FR format object[1]. 
         */
        double value = 12345.567;
// locale preference should be retrieved from user preferences 
        Locale frLocale = new Locale("fr", "FR");
        Locale gbLocale = new Locale("en", "GB");
        NumberFormat nf = NumberFormat.getCurrencyInstance(frLocale);
        String formattedValue = nf.format(value);
        System.out.println("Locale: " + frLocale + " value=" + formattedValue);
        Currency newCurrency = Currency.getInstance("EUR");
        nf.setCurrency(newCurrency);
        formattedValue = nf.format(value);
        System.out.println(
                "Cur Locale: " + frLocale + " value=" + formattedValue);
        nf = NumberFormat.getCurrencyInstance(gbLocale);
        formattedValue = nf.format(value);
        System.out.println(
                "\nLocale: " + gbLocale + " value=" + formattedValue);
        newCurrency = Currency.getInstance("EUR");
        nf.setCurrency(newCurrency);
        formattedValue = nf.format(value);
        System.out.println(
                "Cur Locale: " + gbLocale + " value=" + formattedValue);

        showByLocale(-123456.456);
        System.exit(0);
    }

    public static void showByLocale(double myNumber) throws Exception {
// Print out a number using the localized number, integer, currency, 
// and percent format for each locale 
        Locale[] locales = NumberFormat.getAvailableLocales();
//double myNumber = -1234.56; 
        NumberFormat form;
        for (int j = 0; j < 4; ++j) {
            System.out.println("FORMAT");
            for (int i = 0; i < locales.length; ++i) {
                if (locales[i].getCountry().length() == 0) {
                    continue; // Skip language-only locales 
                }
                System.out.print(locales[i].getDisplayName());
                switch (j) {
                    case 0:
                        form = NumberFormat.getInstance(locales[i]);
                        break;
                    case 1:
                        form = NumberFormat.getIntegerInstance(locales[i]);
                        break;
                    case 2:
                        form = NumberFormat.getCurrencyInstance(locales[i]);
                        break;
                    default:
                        form = NumberFormat.getPercentInstance(locales[i]);
                        break;
                }
                if (form instanceof DecimalFormat) {
                    System.out.print(": " + ((DecimalFormat) form).toPattern());
                }
                System.out.print(" -> " + form.format(myNumber));
//try 
//{ 
                System.out.println(" -> " + form.parse(form.format(myNumber)));
//} 
//catch (ParseException e) {} 
            }
        }
    }

    public static StringBuffer showHTMLByLocale(double myNumber) {
        return null;
    }
    }
