include $(top_srcdir)/config/utility.am
include $(top_srcdir)/config/java.am
include $(top_srcdir)/common.am

EXTRA_DIST = \
	$(cfg_SRC) \
	$(cfg_RESOURCES) \
	$(test_SRC) \
	packages

# tests do not compile
noinst_DATA = \
	javac-cfg	
# javac-test   tests do not compile	

web_JAVAROOT=plugin

DART_SRC = $(shell cd $(srcdir)/plugin; find . -maxdepth 1 -name '*.dart' -not -name sipxconfig.dart)
DART_PKGS = $(shell cd $(top_srcdir); find . -name '*.js')

java-dart : $(addprefix $(web_JAVAROOT)/,$(DART_SRC:.dart=.js) $(DART_PKGS))

$(addprefix $(web_JAVAROOT)/,$(DART_PKGS)) : $(DART_PKGS)
	test -d $(dir $@) || mkdir -p $(dir $@)
	cp $< $@

$(addprefix $(web_JAVAROOT)/,$(DART_SRC:.dart=.js)) : $(web_JAVAROOT)/%.js : plugin/%.dart
	test -d $(dir $@) || mkdir -p $(dir $@)
	$(DART_HOME)/bin/dart2js -o$@ $<

jardir = @SIPX_JAVADIR@/sipXconfig/plugins
jar_DATA = $(cfg_JAR)
cfg_JAR = openfire-cfg-service.jar
cfg_RESOURCES = \
	$(shell cd $(srcdir); find plugin -type f) \
	sipxplugin.beans.xml

web_RESOURCES = $(shell cd $(srcdir); find . -type f  \( \
	  -name '*.css' \
	  -o -name '*.html' \
	  -o -name '*.page' \
	  -o -name '*.js' \
	\))

$(cfg_JAR) : java-dart javac-cfg $(cfg_RESOURCES)
	jar -cf $@ \
		$(call JarInclude,$(JAVAROOT),.) \
		$(call JarInclude,$(web_JAVAROOT),.) \
		$(call JarInclude,$(srcdir),$(cfg_RESOURCES),$(web_RESOURCES))

cfg_DEPS = \
	$(call JavaDep,@SIPX_JAVADIR@/sipXcommons @SIPX_JAVADIR@/sipXconfig,$(cfg_PKGS))

cfg_SRC = \
	$(shell cd $(srcdir); find src -name '*.java')

noinst_DATA = 
test_JAVAROOT = classes.test
test_PKGS = \
	$(openfire_PKGS) \
	junit \
	easymock \
	commons-io \
	sipxcommons

test_DEPS = \
	$(call JavaDep,@SIPX_JAVADIR@/sipXcommons @SIPX_JAVADIR@/sipXconfig,$(test_PKGS))

test_SRC = $(shell cd $(srcdir); find test -name '*.java')
