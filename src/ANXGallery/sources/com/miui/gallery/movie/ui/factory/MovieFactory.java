package com.miui.gallery.movie.ui.factory;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.movie.MovieConfig;
import com.miui.gallery.movie.core.MovieManager;
import com.miui.gallery.movie.nvsdk.NvMovieManager;
import com.miui.gallery.movie.utils.MovieStatUtils;

public class MovieFactory {
    public static MovieManager createMovieManager(Context context) {
        NvMovieManager nvMovieManager = new NvMovieManager();
        nvMovieManager.init(context);
        MovieConfig.init(context);
        return nvMovieManager;
    }

    public static String getParentTemplateName(String str) {
        return TextUtils.equals("movieTemplatePetDog", str) ? "movieTemplatePet" : str;
    }

    public static String getTemplateNameById(int i) {
        switch (i) {
            case 0:
                return MovieStatUtils.FROM_NORMAL;
            case 1:
                return "movieTemplateTravel";
            case 2:
                return "movieTemplateBaby";
            case 3:
                return "movieTemplateParty";
            case 4:
                return "movieTemplateFood";
            case 5:
                return "movieTemplateXmas";
            case 6:
                return "movieTemplateNewYear";
            case 7:
                return "movieTemplateSelfie";
            case 8:
                return "movieTemplatePet";
            case 9:
                return "movieTemplatePetDog";
            default:
                return MovieStatUtils.FROM_NORMAL;
        }
    }
}
