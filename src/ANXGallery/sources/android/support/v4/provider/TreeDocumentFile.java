package android.support.v4.provider;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.util.Log;
import java.util.ArrayList;

class TreeDocumentFile extends DocumentFile {
    private Context mContext;
    private Uri mUri;

    TreeDocumentFile(DocumentFile documentFile, Context context, Uri uri) {
        super(documentFile);
        this.mContext = context;
        this.mUri = uri;
    }

    private static void closeQuietly(AutoCloseable autoCloseable) {
        if (autoCloseable != null) {
            try {
                autoCloseable.close();
            } catch (RuntimeException e) {
                throw e;
            } catch (Exception unused) {
            }
        }
    }

    private static Uri createFile(Context context, Uri uri, String str, String str2) {
        try {
            return DocumentsContract.createDocument(context.getContentResolver(), uri, str, str2);
        } catch (Exception unused) {
            return null;
        }
    }

    public DocumentFile createDirectory(String str) {
        Uri createFile = createFile(this.mContext, this.mUri, "vnd.android.document/directory", str);
        if (createFile != null) {
            return new TreeDocumentFile(this, this.mContext, createFile);
        }
        return null;
    }

    public DocumentFile createFile(String str, String str2) {
        Uri createFile = createFile(this.mContext, this.mUri, str, str2);
        if (createFile != null) {
            return new TreeDocumentFile(this, this.mContext, createFile);
        }
        return null;
    }

    public boolean delete() {
        try {
            return DocumentsContract.deleteDocument(this.mContext.getContentResolver(), this.mUri);
        } catch (Exception unused) {
            return false;
        }
    }

    public String getName() {
        return DocumentsContractApi19.getName(this.mContext, this.mUri);
    }

    public Uri getUri() {
        return this.mUri;
    }

    public boolean isDirectory() {
        return DocumentsContractApi19.isDirectory(this.mContext, this.mUri);
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x0072 A[LOOP:1: B:19:0x006f->B:21:0x0072, LOOP_END] */
    public DocumentFile[] listFiles() {
        Uri[] uriArr;
        ContentResolver contentResolver = this.mContext.getContentResolver();
        Uri buildChildDocumentsUriUsingTree = DocumentsContract.buildChildDocumentsUriUsingTree(this.mUri, DocumentsContract.getDocumentId(this.mUri));
        ArrayList arrayList = new ArrayList();
        Cursor cursor = null;
        try {
            Cursor query = contentResolver.query(buildChildDocumentsUriUsingTree, new String[]{"document_id"}, null, null, null);
            while (query.moveToNext()) {
                try {
                    arrayList.add(DocumentsContract.buildDocumentUriUsingTree(this.mUri, query.getString(0)));
                } catch (Exception e) {
                    e = e;
                    cursor = query;
                    String str = "DocumentFile";
                    try {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Failed query: ");
                        sb.append(e);
                        Log.w(str, sb.toString());
                        closeQuietly(cursor);
                        uriArr = (Uri[]) arrayList.toArray(new Uri[arrayList.size()]);
                        DocumentFile[] documentFileArr = new DocumentFile[uriArr.length];
                        while (r7 < uriArr.length) {
                        }
                        return documentFileArr;
                    } catch (Throwable th) {
                        th = th;
                        closeQuietly(cursor);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    cursor = query;
                    closeQuietly(cursor);
                    throw th;
                }
            }
            closeQuietly(query);
        } catch (Exception e2) {
            e = e2;
            String str2 = "DocumentFile";
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Failed query: ");
            sb2.append(e);
            Log.w(str2, sb2.toString());
            closeQuietly(cursor);
            uriArr = (Uri[]) arrayList.toArray(new Uri[arrayList.size()]);
            DocumentFile[] documentFileArr2 = new DocumentFile[uriArr.length];
            while (r7 < uriArr.length) {
            }
            return documentFileArr2;
        }
        uriArr = (Uri[]) arrayList.toArray(new Uri[arrayList.size()]);
        DocumentFile[] documentFileArr22 = new DocumentFile[uriArr.length];
        for (int i = 0; i < uriArr.length; i++) {
            documentFileArr22[i] = new TreeDocumentFile(this, this.mContext, uriArr[i]);
        }
        return documentFileArr22;
    }
}
