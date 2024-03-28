pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with openssl_asn1_h;
with openssl_crypto_h;
with openssl_core_h;

package openssl_types_h is

  -- * Copyright 2001-2021 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  -- * Unfortunate workaround to avoid symbol conflict with wincrypt.h
  -- * See https://github.com/openssl/openssl/issues/9981
  --  

  -- Provider Object  
   type ossl_provider_st is null record;   -- incomplete struct

   subtype OSSL_PROVIDER is ossl_provider_st;  -- /usr/include/openssl/types.h:36

   subtype ASN1_INTEGER is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:57

   subtype ASN1_ENUMERATED is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:58

   subtype ASN1_BIT_STRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:59

   subtype ASN1_OCTET_STRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:60

   subtype ASN1_PRINTABLESTRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:61

   subtype ASN1_T61STRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:62

   subtype ASN1_IA5STRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:63

   subtype ASN1_GENERALSTRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:64

   subtype ASN1_UNIVERSALSTRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:65

   subtype ASN1_BMPSTRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:66

   subtype ASN1_UTCTIME is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:67

   subtype ASN1_TIME is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:68

   subtype ASN1_GENERALIZEDTIME is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:69

   subtype ASN1_VISIBLESTRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:70

   subtype ASN1_UTF8STRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:71

   subtype ASN1_STRING is openssl_asn1_h.asn1_string_st;  -- /usr/include/openssl/types.h:72

   subtype ASN1_BOOLEAN is int;  -- /usr/include/openssl/types.h:73

   subtype ASN1_NULL is int;  -- /usr/include/openssl/types.h:74

   subtype ASN1_TYPE is openssl_asn1_h.asn1_type_st;  -- /usr/include/openssl/types.h:77

   type asn1_object_st is null record;   -- incomplete struct

   subtype ASN1_OBJECT is asn1_object_st;  -- /usr/include/openssl/types.h:78

   subtype ASN1_STRING_TABLE is openssl_asn1_h.asn1_string_table_st;  -- /usr/include/openssl/types.h:79

   type ASN1_ITEM_st is null record;   -- incomplete struct

   subtype ASN1_ITEM is ASN1_ITEM_st;  -- /usr/include/openssl/types.h:81

   type asn1_pctx_st is null record;   -- incomplete struct

   subtype ASN1_PCTX is asn1_pctx_st;  -- /usr/include/openssl/types.h:82

   type asn1_sctx_st is null record;   -- incomplete struct

   subtype ASN1_SCTX is asn1_sctx_st;  -- /usr/include/openssl/types.h:83

   type bio_st is null record;   -- incomplete struct

   subtype BIO is bio_st;  -- /usr/include/openssl/types.h:89

   type bignum_st is null record;   -- incomplete struct

   subtype BIGNUM is bignum_st;  -- /usr/include/openssl/types.h:90

   type bignum_ctx is null record;   -- incomplete struct

   subtype BN_CTX is bignum_ctx;  -- /usr/include/openssl/types.h:91

   type bn_blinding_st is null record;   -- incomplete struct

   subtype BN_BLINDING is bn_blinding_st;  -- /usr/include/openssl/types.h:92

   type bn_mont_ctx_st is null record;   -- incomplete struct

   subtype BN_MONT_CTX is bn_mont_ctx_st;  -- /usr/include/openssl/types.h:93

   type bn_recp_ctx_st is null record;   -- incomplete struct

   subtype BN_RECP_CTX is bn_recp_ctx_st;  -- /usr/include/openssl/types.h:94

   type bn_gencb_st is null record;   -- incomplete struct

   subtype BN_GENCB is bn_gencb_st;  -- /usr/include/openssl/types.h:95

   type buf_mem_st is null record;   -- incomplete struct

   subtype BUF_MEM is buf_mem_st;  -- /usr/include/openssl/types.h:97

   type stack_st_BIGNUM is null record;   -- incomplete struct

   type stack_st_BIGNUM_const is null record;   -- incomplete struct

   type err_state_st is null record;   -- incomplete struct

   subtype ERR_STATE is err_state_st;  -- /usr/include/openssl/types.h:102

   type evp_cipher_st is null record;   -- incomplete struct

   subtype EVP_CIPHER is evp_cipher_st;  -- /usr/include/openssl/types.h:104

   type evp_cipher_ctx_st is null record;   -- incomplete struct

   subtype EVP_CIPHER_CTX is evp_cipher_ctx_st;  -- /usr/include/openssl/types.h:105

   type evp_md_st is null record;   -- incomplete struct

   subtype EVP_MD is evp_md_st;  -- /usr/include/openssl/types.h:106

   type evp_md_ctx_st is null record;   -- incomplete struct

   subtype EVP_MD_CTX is evp_md_ctx_st;  -- /usr/include/openssl/types.h:107

   type evp_mac_st is null record;   -- incomplete struct

   subtype EVP_MAC is evp_mac_st;  -- /usr/include/openssl/types.h:108

   type evp_mac_ctx_st is null record;   -- incomplete struct

   subtype EVP_MAC_CTX is evp_mac_ctx_st;  -- /usr/include/openssl/types.h:109

   type evp_pkey_st is null record;   -- incomplete struct

   subtype EVP_PKEY is evp_pkey_st;  -- /usr/include/openssl/types.h:110

   type evp_pkey_asn1_method_st is null record;   -- incomplete struct

   subtype EVP_PKEY_ASN1_METHOD is evp_pkey_asn1_method_st;  -- /usr/include/openssl/types.h:112

   type evp_pkey_method_st is null record;   -- incomplete struct

   subtype EVP_PKEY_METHOD is evp_pkey_method_st;  -- /usr/include/openssl/types.h:114

   type evp_pkey_ctx_st is null record;   -- incomplete struct

   subtype EVP_PKEY_CTX is evp_pkey_ctx_st;  -- /usr/include/openssl/types.h:115

   type evp_keymgmt_st is null record;   -- incomplete struct

   subtype EVP_KEYMGMT is evp_keymgmt_st;  -- /usr/include/openssl/types.h:117

   type evp_kdf_st is null record;   -- incomplete struct

   subtype EVP_KDF is evp_kdf_st;  -- /usr/include/openssl/types.h:119

   type evp_kdf_ctx_st is null record;   -- incomplete struct

   subtype EVP_KDF_CTX is evp_kdf_ctx_st;  -- /usr/include/openssl/types.h:120

   type evp_rand_st is null record;   -- incomplete struct

   subtype EVP_RAND is evp_rand_st;  -- /usr/include/openssl/types.h:122

   type evp_rand_ctx_st is null record;   -- incomplete struct

   subtype EVP_RAND_CTX is evp_rand_ctx_st;  -- /usr/include/openssl/types.h:123

   type evp_keyexch_st is null record;   -- incomplete struct

   subtype EVP_KEYEXCH is evp_keyexch_st;  -- /usr/include/openssl/types.h:125

   type evp_signature_st is null record;   -- incomplete struct

   subtype EVP_SIGNATURE is evp_signature_st;  -- /usr/include/openssl/types.h:127

   type evp_asym_cipher_st is null record;   -- incomplete struct

   subtype EVP_ASYM_CIPHER is evp_asym_cipher_st;  -- /usr/include/openssl/types.h:129

   type evp_kem_st is null record;   -- incomplete struct

   subtype EVP_KEM is evp_kem_st;  -- /usr/include/openssl/types.h:131

   type evp_Encode_Ctx_st is null record;   -- incomplete struct

   subtype EVP_ENCODE_CTX is evp_Encode_Ctx_st;  -- /usr/include/openssl/types.h:133

   type hmac_ctx_st is null record;   -- incomplete struct

   subtype HMAC_CTX is hmac_ctx_st;  -- /usr/include/openssl/types.h:135

   type dh_st is null record;   -- incomplete struct

   subtype DH is dh_st;  -- /usr/include/openssl/types.h:137

   type dh_method is null record;   -- incomplete struct

   type dsa_st is null record;   -- incomplete struct

   subtype DSA is dsa_st;  -- /usr/include/openssl/types.h:141

   type dsa_method is null record;   -- incomplete struct

   type rsa_st is null record;   -- incomplete struct

   subtype RSA is rsa_st;  -- /usr/include/openssl/types.h:146

   type rsa_meth_st is null record;   -- incomplete struct

   subtype RSA_METHOD is rsa_meth_st;  -- /usr/include/openssl/types.h:147

   type rsa_pss_params_st is null record;   -- incomplete struct

   subtype RSA_PSS_PARAMS is rsa_pss_params_st;  -- /usr/include/openssl/types.h:149

   type ec_key_st is null record;   -- incomplete struct

   subtype EC_KEY is ec_key_st;  -- /usr/include/openssl/types.h:152

   type ec_key_method_st is null record;   -- incomplete struct

   subtype EC_KEY_METHOD is ec_key_method_st;  -- /usr/include/openssl/types.h:153

   type rand_meth_st is null record;   -- incomplete struct

   subtype RAND_METHOD is rand_meth_st;  -- /usr/include/openssl/types.h:156

   type rand_drbg_st is null record;   -- incomplete struct

   subtype RAND_DRBG is rand_drbg_st;  -- /usr/include/openssl/types.h:157

   type ssl_dane_st is null record;   -- incomplete struct

   subtype SSL_DANE is ssl_dane_st;  -- /usr/include/openssl/types.h:159

   type x509_st is null record;   -- incomplete struct

   subtype X509 is x509_st;  -- /usr/include/openssl/types.h:160

   type X509_algor_st is null record;   -- incomplete struct

   subtype X509_ALGOR is X509_algor_st;  -- /usr/include/openssl/types.h:161

   type X509_crl_st is null record;   -- incomplete struct

   subtype X509_CRL is X509_crl_st;  -- /usr/include/openssl/types.h:162

   type x509_crl_method_st is null record;   -- incomplete struct

   subtype X509_CRL_METHOD is x509_crl_method_st;  -- /usr/include/openssl/types.h:163

   type x509_revoked_st is null record;   -- incomplete struct

   subtype X509_REVOKED is x509_revoked_st;  -- /usr/include/openssl/types.h:164

   type X509_name_st is null record;   -- incomplete struct

   subtype X509_NAME is X509_name_st;  -- /usr/include/openssl/types.h:165

   type X509_pubkey_st is null record;   -- incomplete struct

   subtype X509_PUBKEY is X509_pubkey_st;  -- /usr/include/openssl/types.h:166

   type x509_store_st is null record;   -- incomplete struct

   subtype X509_STORE is x509_store_st;  -- /usr/include/openssl/types.h:167

   type x509_store_ctx_st is null record;   -- incomplete struct

   subtype X509_STORE_CTX is x509_store_ctx_st;  -- /usr/include/openssl/types.h:168

   type x509_object_st is null record;   -- incomplete struct

   subtype X509_OBJECT is x509_object_st;  -- /usr/include/openssl/types.h:170

   type x509_lookup_st is null record;   -- incomplete struct

   subtype X509_LOOKUP is x509_lookup_st;  -- /usr/include/openssl/types.h:171

   type x509_lookup_method_st is null record;   -- incomplete struct

   subtype X509_LOOKUP_METHOD is x509_lookup_method_st;  -- /usr/include/openssl/types.h:172

   type X509_VERIFY_PARAM_st is null record;   -- incomplete struct

   subtype X509_VERIFY_PARAM is X509_VERIFY_PARAM_st;  -- /usr/include/openssl/types.h:173

   type x509_sig_info_st is null record;   -- incomplete struct

   subtype X509_SIG_INFO is x509_sig_info_st;  -- /usr/include/openssl/types.h:175

   type pkcs8_priv_key_info_st is null record;   -- incomplete struct

   subtype PKCS8_PRIV_KEY_INFO is pkcs8_priv_key_info_st;  -- /usr/include/openssl/types.h:177

   type v3_ext_ctx is null record;   -- incomplete struct

   subtype X509V3_CTX is v3_ext_ctx;  -- /usr/include/openssl/types.h:179

   type conf_st is null record;   -- incomplete struct

   subtype CONF is conf_st;  -- /usr/include/openssl/types.h:180

   type ossl_init_settings_st is null record;   -- incomplete struct

   subtype OPENSSL_INIT_SETTINGS is ossl_init_settings_st;  -- /usr/include/openssl/types.h:181

   type ui_st is null record;   -- incomplete struct

   subtype UI is ui_st;  -- /usr/include/openssl/types.h:183

   type ui_method_st is null record;   -- incomplete struct

   subtype UI_METHOD is ui_method_st;  -- /usr/include/openssl/types.h:184

   type engine_st is null record;   -- incomplete struct

   subtype ENGINE is engine_st;  -- /usr/include/openssl/types.h:186

   type ssl_st is null record;   -- incomplete struct

   subtype SSL is ssl_st;  -- /usr/include/openssl/types.h:187

   type ssl_ctx_st is null record;   -- incomplete struct

   subtype SSL_CTX is ssl_ctx_st;  -- /usr/include/openssl/types.h:188

   type comp_ctx_st is null record;   -- incomplete struct

   subtype COMP_CTX is comp_ctx_st;  -- /usr/include/openssl/types.h:190

   type comp_method_st is null record;   -- incomplete struct

   subtype COMP_METHOD is comp_method_st;  -- /usr/include/openssl/types.h:191

   type X509_POLICY_NODE_st is null record;   -- incomplete struct

   subtype X509_POLICY_NODE is X509_POLICY_NODE_st;  -- /usr/include/openssl/types.h:193

   type X509_POLICY_LEVEL_st is null record;   -- incomplete struct

   subtype X509_POLICY_LEVEL is X509_POLICY_LEVEL_st;  -- /usr/include/openssl/types.h:194

   type X509_POLICY_TREE_st is null record;   -- incomplete struct

   subtype X509_POLICY_TREE is X509_POLICY_TREE_st;  -- /usr/include/openssl/types.h:195

   type X509_POLICY_CACHE_st is null record;   -- incomplete struct

   subtype X509_POLICY_CACHE is X509_POLICY_CACHE_st;  -- /usr/include/openssl/types.h:196

   type AUTHORITY_KEYID_st is null record;   -- incomplete struct

   subtype AUTHORITY_KEYID is AUTHORITY_KEYID_st;  -- /usr/include/openssl/types.h:198

   type DIST_POINT_st is null record;   -- incomplete struct

   subtype DIST_POINT is DIST_POINT_st;  -- /usr/include/openssl/types.h:199

   type ISSUING_DIST_POINT_st is null record;   -- incomplete struct

   subtype ISSUING_DIST_POINT is ISSUING_DIST_POINT_st;  -- /usr/include/openssl/types.h:200

   type NAME_CONSTRAINTS_st is null record;   -- incomplete struct

   subtype NAME_CONSTRAINTS is NAME_CONSTRAINTS_st;  -- /usr/include/openssl/types.h:201

   subtype CRYPTO_EX_DATA is openssl_crypto_h.crypto_ex_data_st;  -- /usr/include/openssl/types.h:203

   type ossl_http_req_ctx_st is null record;   -- incomplete struct

   subtype OSSL_HTTP_REQ_CTX is ossl_http_req_ctx_st;  -- /usr/include/openssl/types.h:205

   type ocsp_response_st is null record;   -- incomplete struct

   subtype OCSP_RESPONSE is ocsp_response_st;  -- /usr/include/openssl/types.h:206

   type ocsp_responder_id_st is null record;   -- incomplete struct

   subtype OCSP_RESPID is ocsp_responder_id_st;  -- /usr/include/openssl/types.h:207

   type sct_st is null record;   -- incomplete struct

   subtype SCT is sct_st;  -- /usr/include/openssl/types.h:209

   type sct_ctx_st is null record;   -- incomplete struct

   subtype SCT_CTX is sct_ctx_st;  -- /usr/include/openssl/types.h:210

   type ctlog_st is null record;   -- incomplete struct

   subtype CTLOG is ctlog_st;  -- /usr/include/openssl/types.h:211

   type ctlog_store_st is null record;   -- incomplete struct

   subtype CTLOG_STORE is ctlog_store_st;  -- /usr/include/openssl/types.h:212

   type ct_policy_eval_ctx_st is null record;   -- incomplete struct

   subtype CT_POLICY_EVAL_CTX is ct_policy_eval_ctx_st;  -- /usr/include/openssl/types.h:213

   type ossl_store_info_st is null record;   -- incomplete struct

   subtype OSSL_STORE_INFO is ossl_store_info_st;  -- /usr/include/openssl/types.h:215

   type ossl_store_search_st is null record;   -- incomplete struct

   subtype OSSL_STORE_SEARCH is ossl_store_search_st;  -- /usr/include/openssl/types.h:216

   type ossl_lib_ctx_st is null record;   -- incomplete struct

   subtype OSSL_LIB_CTX is ossl_lib_ctx_st;  -- /usr/include/openssl/types.h:218

   subtype OSSL_DISPATCH is openssl_core_h.ossl_dispatch_st;  -- /usr/include/openssl/types.h:220

   subtype OSSL_ITEM is openssl_core_h.ossl_item_st;  -- /usr/include/openssl/types.h:221

   subtype OSSL_ALGORITHM is openssl_core_h.ossl_algorithm_st;  -- /usr/include/openssl/types.h:222

   subtype OSSL_PARAM is openssl_core_h.ossl_param_st;  -- /usr/include/openssl/types.h:223

   type ossl_param_bld_st is null record;   -- incomplete struct

   subtype OSSL_PARAM_BLD is ossl_param_bld_st;  -- /usr/include/openssl/types.h:224

   --  skipped function type pem_password_cb

   type ossl_encoder_st is null record;   -- incomplete struct

   subtype OSSL_ENCODER is ossl_encoder_st;  -- /usr/include/openssl/types.h:228

   type ossl_encoder_ctx_st is null record;   -- incomplete struct

   subtype OSSL_ENCODER_CTX is ossl_encoder_ctx_st;  -- /usr/include/openssl/types.h:229

   type ossl_decoder_st is null record;   -- incomplete struct

   subtype OSSL_DECODER is ossl_decoder_st;  -- /usr/include/openssl/types.h:230

   type ossl_decoder_ctx_st is null record;   -- incomplete struct

   subtype OSSL_DECODER_CTX is ossl_decoder_ctx_st;  -- /usr/include/openssl/types.h:231

   type ossl_self_test_st is null record;   -- incomplete struct

   subtype OSSL_SELF_TEST is ossl_self_test_st;  -- /usr/include/openssl/types.h:233

end openssl_types_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
