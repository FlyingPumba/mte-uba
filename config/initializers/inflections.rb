# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

# Los saque de: gem 'inflections', require:'inflections/es'
# No puedo lograr que me traiga solo lo de español
#
#
# Siguen estando mal
ActiveSupport::Inflector.inflections do |inflect|
  inflect.clear :all

#  inflect.plural /([^djlnrs])($|_|[A-Z])/, '\1s\2'
 # inflect.plural /([djlnrs])($|_|[A-Z])/, '\1es\2'
 # inflect.plural /(.*)z($|_|[A-Z])$/i, '\1ces\2'

#  inflect.singular /([^djlnrs])s($|_|[A-Z])/, '\1\2'
#  inflect.singular /([djlnrs])es($|_|[A-Z])/, '\1\2'
#  inflect.singular /(.*)ces($|_|[A-Z])$/i, '\1z\2'

#  inflect.plural 'role', 'roles'
#  inflect.singular 'roles', 'role'
  #inflect.plural 'unidad_chofer', 'unidad_chofer'
  #inflect.singular 'unidad_choferes', 'unidad_chofer'
  inflect.plural(/$/, 's')
  inflect.plural(/([^aeéiou])$/i, '\1es')
  inflect.plural(/([aeiou]s)$/i, '\1')
  inflect.plural(/z$/i, 'ces')
  inflect.plural(/á([sn])$/i, 'a\1es')
  inflect.plural(/é([sn])$/i, 'e\1es')
  inflect.plural(/í([sn])$/i, 'i\1es')
  inflect.plural(/ó([sn])$/i, 'o\1es')
  inflect.plural(/ú([sn])$/i, 'u\1es')

  inflect.singular(/s$/, '')
  inflect.singular(/es$/, '')
  inflect.singular(/([sfj]e)s$/, '\1')
  inflect.singular(/ces$/, 'z')

  inflect.irregular('el', 'los')
  inflect.irregular('membership','memberships')
  inflect.irregular('detalle', 'detalles')
end
