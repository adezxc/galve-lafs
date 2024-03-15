--  Generated by gperfhash
package Util.Perfect_Hash is

   function Hash (S : String) return Natural;

   --  Returns true if the string <b>S</b> is a keyword.
   function Is_Keyword (S : in String) return Boolean;

   type Name_Access is access constant String;
   type Keyword_Array is array (Natural range <>) of Name_Access;
   Keywords : constant Keyword_Array;
private

   K_0             : aliased constant String := "ACCESSIBLE";
   K_1             : aliased constant String := "ADD";
   K_2             : aliased constant String := "ALL";
   K_3             : aliased constant String := "ALTER";
   K_4             : aliased constant String := "ANALYZE";
   K_5             : aliased constant String := "AND";
   K_6             : aliased constant String := "AS";
   K_7             : aliased constant String := "ASC";
   K_8             : aliased constant String := "ASENSITIVE";
   K_9             : aliased constant String := "BEFORE";
   K_10            : aliased constant String := "BETWEEN";
   K_11            : aliased constant String := "BIGINT";
   K_12            : aliased constant String := "BINARY";
   K_13            : aliased constant String := "BLOB";
   K_14            : aliased constant String := "BOTH";
   K_15            : aliased constant String := "BY";
   K_16            : aliased constant String := "CALL";
   K_17            : aliased constant String := "CASCADE";
   K_18            : aliased constant String := "CASE";
   K_19            : aliased constant String := "CHANGE";
   K_20            : aliased constant String := "CHAR";
   K_21            : aliased constant String := "CHARACTER";
   K_22            : aliased constant String := "CHECK";
   K_23            : aliased constant String := "COLLATE";
   K_24            : aliased constant String := "COLUMN";
   K_25            : aliased constant String := "CONDITION";
   K_26            : aliased constant String := "CONSTRAINT";
   K_27            : aliased constant String := "CONTINUE";
   K_28            : aliased constant String := "CONVERT";
   K_29            : aliased constant String := "CREATE";
   K_30            : aliased constant String := "CROSS";
   K_31            : aliased constant String := "CURRENT_DATE";
   K_32            : aliased constant String := "CURRENT_TIME";
   K_33            : aliased constant String := "CURRENT_TIMESTAMP";
   K_34            : aliased constant String := "CURRENT_USER";
   K_35            : aliased constant String := "CURSOR";
   K_36            : aliased constant String := "DATABASE";
   K_37            : aliased constant String := "DATABASES";
   K_38            : aliased constant String := "DAY_HOUR";
   K_39            : aliased constant String := "DAY_MICROSECOND";
   K_40            : aliased constant String := "DAY_MINUTE";
   K_41            : aliased constant String := "DAY_SECOND";
   K_42            : aliased constant String := "DEC";
   K_43            : aliased constant String := "DECIMAL";
   K_44            : aliased constant String := "DECLARE";
   K_45            : aliased constant String := "DEFAULT";
   K_46            : aliased constant String := "DELAYED";
   K_47            : aliased constant String := "DELETE";
   K_48            : aliased constant String := "DESC";
   K_49            : aliased constant String := "DESCRIBE";
   K_50            : aliased constant String := "DETERMINISTIC";
   K_51            : aliased constant String := "DISTINCT";
   K_52            : aliased constant String := "DISTINCTROW";
   K_53            : aliased constant String := "DIV";
   K_54            : aliased constant String := "DOUBLE";
   K_55            : aliased constant String := "DROP";
   K_56            : aliased constant String := "DUAL";
   K_57            : aliased constant String := "EACH";
   K_58            : aliased constant String := "ELSE";
   K_59            : aliased constant String := "ELSEIF";
   K_60            : aliased constant String := "ENCLOSED";
   K_61            : aliased constant String := "ESCAPED";
   K_62            : aliased constant String := "EXISTS";
   K_63            : aliased constant String := "EXIT";
   K_64            : aliased constant String := "EXPLAIN";
   K_65            : aliased constant String := "FALSE";
   K_66            : aliased constant String := "FETCH";
   K_67            : aliased constant String := "FLOAT";
   K_68            : aliased constant String := "FLOAT4";
   K_69            : aliased constant String := "FLOAT8";
   K_70            : aliased constant String := "FOR";
   K_71            : aliased constant String := "FORCE";
   K_72            : aliased constant String := "FOREIGN";
   K_73            : aliased constant String := "FROM";
   K_74            : aliased constant String := "FULLTEXT";
   K_75            : aliased constant String := "GRANT";
   K_76            : aliased constant String := "GROUP";
   K_77            : aliased constant String := "HAVING";
   K_78            : aliased constant String := "HIGH_PRIORITY";
   K_79            : aliased constant String := "HOUR_MICROSECOND";
   K_80            : aliased constant String := "HOUR_MINUTE";
   K_81            : aliased constant String := "HOUR_SECOND";
   K_82            : aliased constant String := "IF";
   K_83            : aliased constant String := "IGNORE";
   K_84            : aliased constant String := "IN";
   K_85            : aliased constant String := "INDEX";
   K_86            : aliased constant String := "INFILE";
   K_87            : aliased constant String := "INNER";
   K_88            : aliased constant String := "INOUT";
   K_89            : aliased constant String := "INSENSITIVE";
   K_90            : aliased constant String := "INSERT";
   K_91            : aliased constant String := "INT";
   K_92            : aliased constant String := "INT1";
   K_93            : aliased constant String := "INT2";
   K_94            : aliased constant String := "INT3";
   K_95            : aliased constant String := "INT4";
   K_96            : aliased constant String := "INT8";
   K_97            : aliased constant String := "INTEGER";
   K_98            : aliased constant String := "INTERVAL";
   K_99            : aliased constant String := "INTO";
   K_100           : aliased constant String := "IS";
   K_101           : aliased constant String := "ITERATE";
   K_102           : aliased constant String := "JOIN";
   K_103           : aliased constant String := "KEY";
   K_104           : aliased constant String := "KEYS";
   K_105           : aliased constant String := "KILL";
   K_106           : aliased constant String := "LEADING";
   K_107           : aliased constant String := "LEAVE";
   K_108           : aliased constant String := "LEFT";
   K_109           : aliased constant String := "LIKE";
   K_110           : aliased constant String := "LIMIT";
   K_111           : aliased constant String := "LINEAR";
   K_112           : aliased constant String := "LINES";
   K_113           : aliased constant String := "LOAD";
   K_114           : aliased constant String := "LOCALTIME";
   K_115           : aliased constant String := "LOCALTIMESTAMP";
   K_116           : aliased constant String := "LOCK";
   K_117           : aliased constant String := "LONG";
   K_118           : aliased constant String := "LONGBLOB";
   K_119           : aliased constant String := "LONGTEXT";
   K_120           : aliased constant String := "LOOP";
   K_121           : aliased constant String := "LOW_PRIORITY";
   K_122           : aliased constant String := "MASTER_SSL_VERIFY_SERVER_CERT";
   K_123           : aliased constant String := "MATCH";
   K_124           : aliased constant String := "MAXVALUE";
   K_125           : aliased constant String := "MEDIUMBLOB";
   K_126           : aliased constant String := "MEDIUMINT";
   K_127           : aliased constant String := "MEDIUMTEXT";
   K_128           : aliased constant String := "MIDDLEINT";
   K_129           : aliased constant String := "MINUTE_MICROSECOND";
   K_130           : aliased constant String := "MINUTE_SECOND";
   K_131           : aliased constant String := "MOD";
   K_132           : aliased constant String := "MODIFIES";
   K_133           : aliased constant String := "NATURAL";
   K_134           : aliased constant String := "NOT";
   K_135           : aliased constant String := "NO_WRITE_TO_BINLOG";
   K_136           : aliased constant String := "NULL";
   K_137           : aliased constant String := "NUMERIC";
   K_138           : aliased constant String := "ON";
   K_139           : aliased constant String := "OPTIMIZE";
   K_140           : aliased constant String := "OPTION";
   K_141           : aliased constant String := "OPTIONALLY";
   K_142           : aliased constant String := "OR";
   K_143           : aliased constant String := "ORDER";
   K_144           : aliased constant String := "OUT";
   K_145           : aliased constant String := "OUTER";
   K_146           : aliased constant String := "OUTFILE";
   K_147           : aliased constant String := "PRECISION";
   K_148           : aliased constant String := "PRIMARY";
   K_149           : aliased constant String := "PROCEDURE";
   K_150           : aliased constant String := "PURGE";
   K_151           : aliased constant String := "RANGE";
   K_152           : aliased constant String := "READ";
   K_153           : aliased constant String := "READS";
   K_154           : aliased constant String := "READ_WRITE";
   K_155           : aliased constant String := "REAL";
   K_156           : aliased constant String := "REFERENCES";
   K_157           : aliased constant String := "REGEXP";
   K_158           : aliased constant String := "RELEASE";
   K_159           : aliased constant String := "RENAME";
   K_160           : aliased constant String := "REPEAT";
   K_161           : aliased constant String := "REPLACE";
   K_162           : aliased constant String := "REQUIRE";
   K_163           : aliased constant String := "RESIGNAL";
   K_164           : aliased constant String := "RESTRICT";
   K_165           : aliased constant String := "RETURN";
   K_166           : aliased constant String := "REVOKE";
   K_167           : aliased constant String := "RIGHT";
   K_168           : aliased constant String := "RLIKE";
   K_169           : aliased constant String := "SCHEMA";
   K_170           : aliased constant String := "SCHEMAS";
   K_171           : aliased constant String := "SECOND_MICROSECOND";
   K_172           : aliased constant String := "SELECT";
   K_173           : aliased constant String := "SENSITIVE";
   K_174           : aliased constant String := "SEPARATOR";
   K_175           : aliased constant String := "SET";
   K_176           : aliased constant String := "SHOW";
   K_177           : aliased constant String := "SIGNAL";
   K_178           : aliased constant String := "SMALLINT";
   K_179           : aliased constant String := "SPATIAL";
   K_180           : aliased constant String := "SPECIFIC";
   K_181           : aliased constant String := "SQL";
   K_182           : aliased constant String := "SQLEXCEPTION";
   K_183           : aliased constant String := "SQLSTATE";
   K_184           : aliased constant String := "SQLWARNING";
   K_185           : aliased constant String := "SQL_BIG_RESULT";
   K_186           : aliased constant String := "SQL_CALC_FOUND_ROWS";
   K_187           : aliased constant String := "SQL_SMALL_RESULT";
   K_188           : aliased constant String := "SSL";
   K_189           : aliased constant String := "STARTING";
   K_190           : aliased constant String := "STRAIGHT_JOIN";
   K_191           : aliased constant String := "TABLE";
   K_192           : aliased constant String := "TERMINATED";
   K_193           : aliased constant String := "THEN";
   K_194           : aliased constant String := "TINYBLOB";
   K_195           : aliased constant String := "TINYINT";
   K_196           : aliased constant String := "TINYTEXT";
   K_197           : aliased constant String := "TO";
   K_198           : aliased constant String := "TRAILING";
   K_199           : aliased constant String := "TRIGGER";
   K_200           : aliased constant String := "TRUE";
   K_201           : aliased constant String := "UNDO";
   K_202           : aliased constant String := "UNION";
   K_203           : aliased constant String := "UNIQUE";
   K_204           : aliased constant String := "UNLOCK";
   K_205           : aliased constant String := "UNSIGNED";
   K_206           : aliased constant String := "UPDATE";
   K_207           : aliased constant String := "USAGE";
   K_208           : aliased constant String := "USE";
   K_209           : aliased constant String := "USING";
   K_210           : aliased constant String := "UTC_DATE";
   K_211           : aliased constant String := "UTC_TIME";
   K_212           : aliased constant String := "UTC_TIMESTAMP";
   K_213           : aliased constant String := "VALUES";
   K_214           : aliased constant String := "VARBINARY";
   K_215           : aliased constant String := "VARCHAR";
   K_216           : aliased constant String := "VARCHARACTER";
   K_217           : aliased constant String := "VARYING";
   K_218           : aliased constant String := "WHEN";
   K_219           : aliased constant String := "WHERE";
   K_220           : aliased constant String := "WHILE";
   K_221           : aliased constant String := "WITH";
   K_222           : aliased constant String := "WRITE";
   K_223           : aliased constant String := "XOR";
   K_224           : aliased constant String := "YEAR_MONTH";
   K_225           : aliased constant String := "ZEROFILL";

   Keywords : constant Keyword_Array := (
      K_0'Access, K_1'Access, K_2'Access, K_3'Access,
      K_4'Access, K_5'Access, K_6'Access, K_7'Access,
      K_8'Access, K_9'Access, K_10'Access, K_11'Access,
      K_12'Access, K_13'Access, K_14'Access, K_15'Access,
      K_16'Access, K_17'Access, K_18'Access, K_19'Access,
      K_20'Access, K_21'Access, K_22'Access, K_23'Access,
      K_24'Access, K_25'Access, K_26'Access, K_27'Access,
      K_28'Access, K_29'Access, K_30'Access, K_31'Access,
      K_32'Access, K_33'Access, K_34'Access, K_35'Access,
      K_36'Access, K_37'Access, K_38'Access, K_39'Access,
      K_40'Access, K_41'Access, K_42'Access, K_43'Access,
      K_44'Access, K_45'Access, K_46'Access, K_47'Access,
      K_48'Access, K_49'Access, K_50'Access, K_51'Access,
      K_52'Access, K_53'Access, K_54'Access, K_55'Access,
      K_56'Access, K_57'Access, K_58'Access, K_59'Access,
      K_60'Access, K_61'Access, K_62'Access, K_63'Access,
      K_64'Access, K_65'Access, K_66'Access, K_67'Access,
      K_68'Access, K_69'Access, K_70'Access, K_71'Access,
      K_72'Access, K_73'Access, K_74'Access, K_75'Access,
      K_76'Access, K_77'Access, K_78'Access, K_79'Access,
      K_80'Access, K_81'Access, K_82'Access, K_83'Access,
      K_84'Access, K_85'Access, K_86'Access, K_87'Access,
      K_88'Access, K_89'Access, K_90'Access, K_91'Access,
      K_92'Access, K_93'Access, K_94'Access, K_95'Access,
      K_96'Access, K_97'Access, K_98'Access, K_99'Access,
      K_100'Access, K_101'Access, K_102'Access, K_103'Access,
      K_104'Access, K_105'Access, K_106'Access, K_107'Access,
      K_108'Access, K_109'Access, K_110'Access, K_111'Access,
      K_112'Access, K_113'Access, K_114'Access, K_115'Access,
      K_116'Access, K_117'Access, K_118'Access, K_119'Access,
      K_120'Access, K_121'Access, K_122'Access, K_123'Access,
      K_124'Access, K_125'Access, K_126'Access, K_127'Access,
      K_128'Access, K_129'Access, K_130'Access, K_131'Access,
      K_132'Access, K_133'Access, K_134'Access, K_135'Access,
      K_136'Access, K_137'Access, K_138'Access, K_139'Access,
      K_140'Access, K_141'Access, K_142'Access, K_143'Access,
      K_144'Access, K_145'Access, K_146'Access, K_147'Access,
      K_148'Access, K_149'Access, K_150'Access, K_151'Access,
      K_152'Access, K_153'Access, K_154'Access, K_155'Access,
      K_156'Access, K_157'Access, K_158'Access, K_159'Access,
      K_160'Access, K_161'Access, K_162'Access, K_163'Access,
      K_164'Access, K_165'Access, K_166'Access, K_167'Access,
      K_168'Access, K_169'Access, K_170'Access, K_171'Access,
      K_172'Access, K_173'Access, K_174'Access, K_175'Access,
      K_176'Access, K_177'Access, K_178'Access, K_179'Access,
      K_180'Access, K_181'Access, K_182'Access, K_183'Access,
      K_184'Access, K_185'Access, K_186'Access, K_187'Access,
      K_188'Access, K_189'Access, K_190'Access, K_191'Access,
      K_192'Access, K_193'Access, K_194'Access, K_195'Access,
      K_196'Access, K_197'Access, K_198'Access, K_199'Access,
      K_200'Access, K_201'Access, K_202'Access, K_203'Access,
      K_204'Access, K_205'Access, K_206'Access, K_207'Access,
      K_208'Access, K_209'Access, K_210'Access, K_211'Access,
      K_212'Access, K_213'Access, K_214'Access, K_215'Access,
      K_216'Access, K_217'Access, K_218'Access, K_219'Access,
      K_220'Access, K_221'Access, K_222'Access, K_223'Access,
      K_224'Access, K_225'Access);
end Util.Perfect_Hash;
