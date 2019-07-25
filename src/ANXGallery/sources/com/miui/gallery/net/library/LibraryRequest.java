package com.miui.gallery.net.library;

import com.google.gson.JsonParseException;
import com.google.gson.reflect.TypeToken;
import com.miui.gallery.assistant.library.Library;
import com.miui.gallery.assistant.library.LibraryConstants;
import com.miui.gallery.net.BaseGalleryRequest;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.util.MiscUtil;
import org.json.JSONObject;

public class LibraryRequest extends BaseGalleryRequest {
    private final long mLibraryId;

    public LibraryRequest(long j) {
        super(0, "https://i.mi.com/gallery/public/resource/info/v2");
        this.mLibraryId = j;
        addParam("nameSpace", "miui_assistant");
        addParam("group", String.valueOf(this.mLibraryId));
        addParam("key", LibraryConstants.CURRENT_ABI);
        setUseCache(false);
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(JSONObject jSONObject) throws Exception {
        try {
            Library library = (Library) fromJson(jSONObject.toString(), new TypeToken<Library>() {
            }.getType());
            if (library == null || !MiscUtil.isValid(library.getLibraryItems())) {
                library = null;
            } else {
                library.setLibraryId(this.mLibraryId);
            }
            deliverResponse(library);
        } catch (JsonParseException e) {
            e.printStackTrace();
            deliverError(ErrorCode.PARSE_ERROR, e.getMessage(), jSONObject);
        } catch (Exception e2) {
            e2.printStackTrace();
            deliverError(ErrorCode.HANDLE_ERROR, e2.getMessage(), jSONObject);
        }
    }
}
