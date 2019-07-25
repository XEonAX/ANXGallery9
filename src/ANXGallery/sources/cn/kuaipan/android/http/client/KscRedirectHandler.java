package cn.kuaipan.android.http.client;

import java.net.URI;
import java.util.LinkedList;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolException;
import org.apache.http.impl.client.DefaultRedirectHandler;
import org.apache.http.protocol.HttpContext;

public class KscRedirectHandler extends DefaultRedirectHandler {
    public URI getLocationURI(HttpResponse httpResponse, HttpContext httpContext) throws ProtocolException {
        URI locationURI = KscRedirectHandler.super.getLocationURI(httpResponse, httpContext);
        List list = (List) httpContext.getAttribute("ksc.message_list");
        if (list == null) {
            list = new LinkedList();
            httpContext.setAttribute("ksc.message_list", list);
        }
        list.add(httpResponse);
        return locationURI;
    }
}
