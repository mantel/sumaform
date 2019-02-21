{% for keypath in grains.get('gpg_keys') | default([], true) %}
{% set keyname =  salt['file.basename'](keypath)  %}
gpg_key_copy_{{ keypath }}:
  file.managed:
    - name: /tmp/{{ keyname }}
    - source: salt://{{ keypath }}
install_{{ keypath }}:
  cmd.wait:
    - name: rpm --import /tmp/{{ salt['file.basename'](keypath) }}
    - watch:
      - file: /tmp/{{ keyname }}
{% endfor %}

{% if grains['os'] == 'SUSE' %}

{% if grains['osrelease'] == '42.3' %}
os_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/distribution/leap/42.3/repo/oss/suse/

os_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/update/leap/42.3/oss/
{% endif %} {# grains['osrelease'] == '42.3' #}


{% if grains['osrelease'] == '11.4' %}

os_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") }}/repo/$RCE/SLES11-SP4-Pool/sle-11-x86_64/

os_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") }}/repo/$RCE/SLES11-SP4-Updates/sle-11-x86_64/

{% if grains.get('use_unreleased_updates') | default(False, true) %}
test_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/11-SP4:/x86_64/update/
    - gpgcheck: 1
    - gpgkey: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/11-SP4:/x86_64/update/repodata/repomd.xml.key
{% endif %}

tools_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") }}/repo/$RCE/SLES11-SP4-SUSE-Manager-Tools/sle-11-x86_64/

{% if 'nightly' in grains.get('product_version') | default('', true) %}

tools_additional_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/3.2:/SLE11-SUSE-Manager-Tools/images/repo/SLE-11-SP4-CLIENT-TOOLS-ia64-ppc64-s390x-x86_64-Media1/suse/
    - priority: 98

{% elif 'head' in grains.get('product_version') | default('', true) %}

tools_additional_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head:/SLE11-SUSE-Manager-Tools/images/repo/SLE-11-SP4-CLIENT-TOOLS-ia64-ppc64-s390x-x86_64-Media1/suse/
    - priority: 98

{% endif %}

{% endif %} {# grains['osrelease'] == '11.4' #}


{% if '12' in grains['osrelease'] %}
{% if grains['osrelease'] == '12' %}
os_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-SERVER/12/x86_64/product/

os_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-SERVER/12/x86_64/update/

{% if grains.get('use_unreleased_updates') | default(False, true) %}
test_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/12:/x86_64/update/
    - gpgcheck: 1
    - gpgkey: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/12:/x86_64/update/repodata/repomd.xml.key
{% endif %}

{% elif grains['osrelease'] == '12.1' %}

os_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-SERVER/12-SP1/x86_64/product/

os_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-SERVER/12-SP1/x86_64/update/

{% if grains.get('use_unreleased_updates') | default(False, true) %}
test_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/12-SP1:/x86_64/update/
    - gpgcheck: 1
    - gpgkey: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/12-SP1:/x86_64/update/repodata/repomd.xml.key
{% endif %}

{% elif grains['osrelease'] == '12.2' %}

os_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-SERVER/12-SP2/x86_64/product/

os_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-SERVER/12-SP2/x86_64/update/

{% if grains.get('use_unreleased_updates') | default(False, true) %}
test_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/12-SP2:/x86_64/update/
    - gpgcheck: 1
    - gpgkey: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/12-SP2:/x86_64/update/repodata/repomd.xml.key
{% endif %}

{% elif grains['osrelease'] == '12.3' %}

os_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-SERVER/12-SP3/x86_64/product/

os_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-SERVER/12-SP3/x86_64/update/

{% if grains.get('use_unreleased_updates') | default(False, true) %}
test_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/12-SP3:/x86_64/update/
    - gpgcheck: 1
    - gpgkey: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/12-SP3:/x86_64/update/repodata/repomd.xml.key
{% endif %}

{% elif grains['osrelease'] == '12.4' %}

os_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-SERVER/12-SP4/x86_64/product/

os_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-SERVER/12-SP4/x86_64/update/

{% if grains.get('use_unreleased_updates') | default(False, true) %}
test_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/12-SP4:/x86_64/update/
    - gpgcheck: 1
    - gpgkey: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-SERVER:/12-SP4:/x86_64/update/repodata/repomd.xml.key
{% endif %}

{% endif %}

{% if not grains.get('role') or not grains.get('role').startswith('suse_manager') %}
tools_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Manager-Tools/12/x86_64/product/

tools_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Manager-Tools/12/x86_64/update/

{% if 'nightly' in grains.get('product_version') | default('', true) %}

tools_additional_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/3.2:/SLE12-SUSE-Manager-Tools/images/repo/SLE-12-Manager-Tools-POOL-x86_64-Media1/
    - priority: 98

{% elif ('head' in grains.get('product_version') | default('', true)) or ('test' in grains.get('product_version') | default('', true)) %}

tools_additional_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head:/SLE12-SUSE-Manager-Tools/images/repo/SLE-12-Manager-Tools-POOL-x86_64-Media1/
    - priority: 98

{% endif %}

{% endif %} {# not grains.get('role') or not grains.get('role').startswith('suse_manager') #}
{% endif %} {# '12' in grains['osrelease'] #}


{% if '15' in grains['osrelease'] %}
{% if not grains.get('role') or not grains.get('role').startswith('suse_manager') %}

tools_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Manager-Tools/15/x86_64/product/

tools_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/SLE-15:/GA:/TEST/images/repo/SLE-15-Manager-Tools-POOL-x86_64-Media1/

{% if 'nightly' in grains.get('product_version') | default('', true) %}

tools_additional_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/3.2:/SLE15-SUSE-Manager-Tools/images/repo/SLE-15-Manager-Tools-POOL-x86_64-Media1/
    - priority: 98

{% elif ('head' in grains.get('product_version') | default('', true)) or ('test' in grains.get('product_version') | default('', true)) %}
tools_additional_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head:/SLE15-SUSE-Manager-Tools/images/repo/SLE-15-Manager-Tools-POOL-x86_64-Media1/
    - priority: 98

{% endif %}
{% endif %} {# not grains.get('role') or not grains.get('role').startswith('suse_manager') #}
{% endif %} {# '15' in grains['osrelease'] #}

{% if '15' == grains['osrelease'] %}
os_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Basesystem/15/x86_64/product/

os_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Basesystem/15/x86_64/update/

{% if grains.get('use_unreleased_updates') | default(False, true) %}
test_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/Maintenance:/Test:/SLE-Module-Basesystem:/15:/x86_64/update/
    - gpgcheck: 1
{% endif %}
{% endif %} {# '15' == grains['osrelease'] #}

{% if '15.1' == grains['osrelease'] %}
os_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Basesystem/15-SP1/x86_64/product/

os_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Basesystem/15-SP1/x86_64/update/
{% endif %} {# '15.1' == grains['osrelease'] #}



allow_vendor_changes:
  {% if grains['osfullname'] == 'Leap' %}
  file.managed:
    - name: /etc/zypp/vendors.d/opensuse
    - makedirs: True
    - contents: |
        [main]
        vendors = openSUSE,openSUSE Build Service,obs://build.suse.de/Devel:Galaxy,obs://build.opensuse.org
  {% else %}
  file.managed:
    - name: /etc/zypp/vendors.d/suse
    - makedirs: True
    - contents: |
        [main]
        vendors = SUSE,openSUSE Build Service,obs://build.suse.de/Devel:Galaxy,obs://build.opensuse.org
  {% endif %}

{% if grains.get('product_version') == 'test' %}
allow_all_vendor_changes:
  file.append:
    - name: /etc/zypp/zypp.conf
    - text: solver.allowVendorChange = true
{% endif %}

{% endif %}

{% if grains['os_family'] == 'RedHat' %}

galaxy_key:
  file.managed:
    - name: /tmp/galaxy.key
    - source: salt://default/gpg_keys/galaxy.key
  cmd.wait:
    - name: rpm --import /tmp/galaxy.key
    - watch:
      - file: galaxy_key

{% if grains.get('osmajorrelease', None)|int() == 7 %}
tools_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") }}/repo/$RCE/RES7-SUSE-Manager-Tools/x86_64/
    - require:
      - cmd: galaxy_key

suse_res7_key:
  file.managed:
    - name: /tmp/suse_res7.key
    - source: salt://default/gpg_keys/suse_res7.key
  cmd.wait:
    - name: rpm --import /tmp/suse_res7.key
    - watch:
      - file: suse_res7_key

{% if 'head' in grains.get('product_version') | default('', true) %}
tools_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head:/RES7-SUSE-Manager-Tools/SUSE_RES-7_Update_standard/
    - priority: 98
    - require:
      - cmd: galaxy_key

{% elif 'nightly' in grains.get('product_version') | default('', true) %}
tools_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/3.2:/RES7-SUSE-Manager-Tools/SUSE_RES-7_Update_standard/
    - require:
      - cmd: galaxy_key
{% endif %}
{% endif %} {# grains.get('osmajorrelease', None)|int() == 7 #}

{% endif %} {# grains['os_family'] == 'RedHat' #}

{% if grains['additional_repos'] %}
{% for label, url in grains['additional_repos'].items() %}
{{ label }}_repo:
  pkgrepo.managed:
    - humanname: {{ label }}
  {%- if grains['os_family'] == 'Debian' %}
    - name: deb {{ url }} /
    - file: /etc/apt/sources.list.d/sumaform_additional_repos.list
    - key_url: {{ url }}/Release.key
  {%- else %}
    - baseurl: {{ url }}
    - priority: 94
    - gpgcheck: 0
  {%- endif %}
{% endfor %}
{% endif %}

# HACK: work around #10852
{{ sls }}_nop:
  test.nop: []
