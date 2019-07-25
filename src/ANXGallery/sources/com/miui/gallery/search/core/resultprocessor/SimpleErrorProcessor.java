package com.miui.gallery.search.core.resultprocessor;

import com.miui.gallery.search.SearchConstants;
import com.miui.gallery.search.core.result.ErrorInfo;
import com.miui.gallery.search.core.result.SourceResult;
import com.miui.gallery.search.utils.SearchUtils;
import java.util.List;

public class SimpleErrorProcessor {
    public ErrorInfo process(List<SourceResult> list) {
        ErrorInfo errorInfo = null;
        if (list == null || list.isEmpty()) {
            return null;
        }
        if (list.size() == 1) {
            return ((SourceResult) list.get(0)).getErrorInfo();
        }
        int i = -1;
        for (SourceResult sourceResult : list) {
            int errorStatus = SearchUtils.getErrorStatus(sourceResult);
            if (SearchConstants.isErrorStatus(errorStatus) && SearchConstants.compareErrorStatus(errorStatus, i) > 0) {
                errorInfo = sourceResult.getErrorInfo();
                i = errorStatus;
            }
        }
        return errorInfo;
    }
}
