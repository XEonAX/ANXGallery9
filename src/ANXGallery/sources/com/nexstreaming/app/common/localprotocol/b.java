package com.nexstreaming.app.common.localprotocol;

import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.util.Log;
import com.nexstreaming.app.common.localprotocol.c.a;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.ClosedChannelException;

/* compiled from: nexClient */
public class b {
    LocalSocket a;
    private String b;

    public b(String str) {
        this.b = str;
    }

    public a a(short s, int i, boolean z) throws IOException {
        LocalSocket localSocket = this.a;
        if (localSocket != null) {
            ByteBuffer allocate = ByteBuffer.allocate(16);
            c.a(localSocket, allocate.array(), allocate.array().length);
            com.nexstreaming.app.common.localprotocol.c.b a2 = c.a(allocate, i, z);
            if (!a2.b) {
                StringBuilder sb = new StringBuilder();
                sb.append("'receive' Header is invalid. error=");
                sb.append(a2.f);
                Log.w("nexClient", sb.toString());
                throw new ClosedChannelException();
            } else if (s == a2.d) {
                a aVar = new a(a2);
                aVar.a = new byte[a2.g];
                c.a(localSocket, aVar.a, aVar.a.length);
                return aVar;
            } else {
                Log.w("nexClient", "'receive' command is invalid. ");
                throw new ClosedChannelException();
            }
        } else {
            Log.w("nexClient", "'receive' request on closed Socket ");
            throw new ClosedChannelException();
        }
    }

    public void a(short s, int i, byte[] bArr) throws IOException {
        LocalSocket localSocket = this.a;
        if (localSocket != null) {
            localSocket.getOutputStream().write(c.a(s, i, bArr.length));
            localSocket.getOutputStream().write(bArr);
            return;
        }
        Log.w("nexClient", "'send' request on closed Socket ");
        throw new ClosedChannelException();
    }

    public boolean a() {
        this.a = new LocalSocket();
        try {
            this.a.connect(new LocalSocketAddress(this.b));
            return true;
        } catch (IOException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("Exception ");
            sb.append(e);
            sb.append(" while connect Socket");
            Log.e("nexClient", sb.toString());
            return false;
        }
    }

    public boolean b() {
        LocalSocket localSocket;
        synchronized (this) {
            localSocket = this.a;
            this.a = null;
        }
        if (localSocket != null) {
            try {
                localSocket.shutdownInput();
                localSocket.shutdownOutput();
                localSocket.close();
                Log.d("nexClient", "Socket is closed");
                return true;
            } catch (IOException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("Exception ");
                sb.append(e);
                sb.append(" while closing Socket");
                Log.e("nexClient", sb.toString());
            }
        }
        return false;
    }
}
