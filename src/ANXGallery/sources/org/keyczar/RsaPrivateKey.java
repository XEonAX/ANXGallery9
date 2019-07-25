package org.keyczar;

import com.google.gson_nex.annotations.Expose;
import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.Signature;
import java.security.SignatureException;
import java.security.interfaces.RSAPrivateCrtKey;
import java.security.spec.RSAPrivateCrtKeySpec;
import javax.crypto.Cipher;
import javax.crypto.ShortBufferException;
import org.keyczar.enums.RsaPadding;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.interfaces.DecryptingStream;
import org.keyczar.interfaces.EncryptingStream;
import org.keyczar.interfaces.KeyType;
import org.keyczar.interfaces.SigningStream;
import org.keyczar.interfaces.Stream;
import org.keyczar.interfaces.VerifyingStream;
import org.keyczar.util.Util;

public class RsaPrivateKey extends KeyczarKey implements KeyczarPrivateKey {
    private static final String KEY_GEN_ALGORITHM = "RSA";
    private static final String SIG_ALGORITHM = "SHA1withRSA";
    @Expose
    private final String crtCoefficient;
    /* access modifiers changed from: private */
    public RSAPrivateCrtKey jcePrivateKey;
    @Expose
    private final String primeExponentP;
    @Expose
    private final String primeExponentQ;
    @Expose
    private final String primeP;
    @Expose
    private final String primeQ;
    @Expose
    private final String privateExponent;
    /* access modifiers changed from: private */
    @Expose
    public final RsaPublicKey publicKey;

    private class RsaPrivateStream implements DecryptingStream, EncryptingStream, SigningStream, VerifyingStream {
        private Cipher cipher;
        private EncryptingStream encryptingStream;
        private Signature signature;
        private VerifyingStream verifyingStream;

        public RsaPrivateStream() throws KeyczarException {
            try {
                this.signature = Signature.getInstance(RsaPrivateKey.SIG_ALGORITHM);
                this.verifyingStream = (VerifyingStream) RsaPrivateKey.this.publicKey.getStream();
                this.cipher = Cipher.getInstance(RsaPrivateKey.this.publicKey.getPadding().getCryptAlgorithm());
                this.encryptingStream = (EncryptingStream) RsaPrivateKey.this.publicKey.getStream();
            } catch (GeneralSecurityException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public int digestSize() {
            return RsaPrivateKey.this.getType().getOutputSize();
        }

        public int doFinalDecrypt(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws KeyczarException {
            try {
                return this.cipher.doFinal(byteBuffer, byteBuffer2);
            } catch (GeneralSecurityException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public int doFinalEncrypt(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws KeyczarException {
            return this.encryptingStream.doFinalEncrypt(byteBuffer, byteBuffer2);
        }

        public SigningStream getSigningStream() throws KeyczarException {
            return this.encryptingStream.getSigningStream();
        }

        public VerifyingStream getVerifyingStream() {
            return new VerifyingStream() {
                public int digestSize() {
                    return 0;
                }

                public void initVerify() {
                }

                public void updateVerify(ByteBuffer byteBuffer) {
                }

                public boolean verify(ByteBuffer byteBuffer) {
                    return true;
                }
            };
        }

        public void initDecrypt(ByteBuffer byteBuffer) throws KeyczarException {
            try {
                this.cipher.init(2, RsaPrivateKey.this.jcePrivateKey);
            } catch (InvalidKeyException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public int initEncrypt(ByteBuffer byteBuffer) throws KeyczarException {
            return this.encryptingStream.initEncrypt(byteBuffer);
        }

        public void initSign() throws KeyczarException {
            try {
                this.signature.initSign(RsaPrivateKey.this.jcePrivateKey);
            } catch (GeneralSecurityException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public void initVerify() throws KeyczarException {
            this.verifyingStream.initVerify();
        }

        public int maxOutputSize(int i) {
            return RsaPrivateKey.this.getType().getOutputSize(RsaPrivateKey.this.size);
        }

        public void sign(ByteBuffer byteBuffer) throws KeyczarException {
            try {
                byteBuffer.put(this.signature.sign());
            } catch (SignatureException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public int updateDecrypt(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws KeyczarException {
            try {
                return this.cipher.update(byteBuffer, byteBuffer2);
            } catch (ShortBufferException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public int updateEncrypt(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws KeyczarException {
            return this.encryptingStream.updateEncrypt(byteBuffer, byteBuffer2);
        }

        public void updateSign(ByteBuffer byteBuffer) throws KeyczarException {
            try {
                this.signature.update(byteBuffer);
            } catch (SignatureException e) {
                throw new KeyczarException((Throwable) e);
            }
        }

        public void updateVerify(ByteBuffer byteBuffer) throws KeyczarException {
            this.verifyingStream.updateVerify(byteBuffer);
        }

        public boolean verify(ByteBuffer byteBuffer) throws KeyczarException {
            return this.verifyingStream.verify(byteBuffer);
        }
    }

    private RsaPrivateKey() {
        super(0);
        this.publicKey = null;
        this.privateExponent = null;
        this.primeP = null;
        this.primeQ = null;
        this.primeExponentP = null;
        this.primeExponentQ = null;
        this.crtCoefficient = null;
        this.jcePrivateKey = null;
    }

    public RsaPrivateKey(RSAPrivateCrtKey rSAPrivateCrtKey, RsaPadding rsaPadding) throws KeyczarException {
        super(rSAPrivateCrtKey.getModulus().bitLength());
        this.publicKey = new RsaPublicKey(rSAPrivateCrtKey, rsaPadding);
        this.privateExponent = Util.encodeBigInteger(rSAPrivateCrtKey.getPrivateExponent());
        this.primeP = Util.encodeBigInteger(rSAPrivateCrtKey.getPrimeP());
        this.primeQ = Util.encodeBigInteger(rSAPrivateCrtKey.getPrimeQ());
        this.primeExponentP = Util.encodeBigInteger(rSAPrivateCrtKey.getPrimeExponentP());
        this.primeExponentQ = Util.encodeBigInteger(rSAPrivateCrtKey.getPrimeExponentQ());
        this.crtCoefficient = Util.encodeBigInteger(rSAPrivateCrtKey.getCrtCoefficient());
        this.jcePrivateKey = rSAPrivateCrtKey;
    }

    static RsaPrivateKey generate(int i, RsaPadding rsaPadding) throws KeyczarException {
        return new RsaPrivateKey((RSAPrivateCrtKey) Util.generateKeyPair(KEY_GEN_ALGORITHM, i).getPrivate(), rsaPadding);
    }

    static RsaPrivateKey generate(RsaPadding rsaPadding) throws KeyczarException {
        return generate(DefaultKeyType.RSA_PRIV.defaultSize(), rsaPadding);
    }

    private RsaPrivateKey initFromJson() throws KeyczarException {
        this.publicKey.initFromJson();
        try {
            KeyFactory instance = KeyFactory.getInstance(KEY_GEN_ALGORITHM);
            RSAPrivateCrtKeySpec rSAPrivateCrtKeySpec = new RSAPrivateCrtKeySpec(Util.decodeBigInteger(this.publicKey.modulus), Util.decodeBigInteger(this.publicKey.publicExponent), Util.decodeBigInteger(this.privateExponent), Util.decodeBigInteger(this.primeP), Util.decodeBigInteger(this.primeQ), Util.decodeBigInteger(this.primeExponentP), Util.decodeBigInteger(this.primeExponentQ), Util.decodeBigInteger(this.crtCoefficient));
            this.jcePrivateKey = (RSAPrivateCrtKey) instance.generatePrivate(rSAPrivateCrtKeySpec);
            return this;
        } catch (GeneralSecurityException e) {
            throw new KeyczarException((Throwable) e);
        }
    }

    static RsaPrivateKey read(String str) throws KeyczarException {
        return ((RsaPrivateKey) Util.gson().fromJson(str, RsaPrivateKey.class)).initFromJson();
    }

    /* access modifiers changed from: protected */
    public RSAPrivateCrtKey getJceKey() {
        return this.jcePrivateKey;
    }

    public KeyczarPublicKey getPublic() {
        return this.publicKey;
    }

    /* access modifiers changed from: protected */
    public Stream getStream() throws KeyczarException {
        return new RsaPrivateStream();
    }

    public KeyType getType() {
        return DefaultKeyType.RSA_PRIV;
    }

    /* access modifiers changed from: protected */
    public byte[] hash() {
        return this.publicKey.hash();
    }
}
