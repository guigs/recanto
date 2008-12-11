{
  :'pt-BR' => {
    # formatos de data e hora
    :date => {
      :formats => {
        :default => "%d/%m/%Y",
        :short => lambda { |date| "#{date.day} %b" },
        :long => lambda { |date| "#{date.day} de %B de %Y" },
        :only_day => "%e"
      },
      :day_names => %w(Domingo Segunda Terça Quarta Quinta Sexta Sábado),
      :abbr_day_names => %w(Dom Seg Ter Qua Qui Sex Sáb),
      :month_names => [nil] + %w(Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro),
      :abbr_month_names => [nil] + %w(Jan Fev Mar Abr Mai Jun Jul Ago Set Out Nov Dez),
      :order => [:day, :month, :year]
    },
    :time => {
      :formats => {
        :default => lambda { |time| "%A, #{time.day} de %B de %Y, %H:%M hs" },
        :time => "%H:%M hs",
        :short => lambda { |time| "#{time.day}/%m, %H:%M hs" },
        :long => lambda { |time| "%A, #{time.day} de %B de %Y, %H:%M hs" },
        :only_second => "%S"
      },
      :am => '',
      :pm => ''
    },

    # date helper distanci em palavras
    :datetime => {
      :distance_in_words => {
        :half_a_minute => 'meio minuto',
        :less_than_x_seconds => {
          :one => 'menos de 1 segundo',
          :other => 'menos de {{count}} segundos'
        },
        :x_seconds => {
          :one => '1 segundo',
          :other => '{{count}} segundos'
        },
        :less_than_x_minutes => {
          :one => 'menos de um minuto',
          :other => 'menos de {{count}} minutos'
        },
        :x_minutes => {
          :one => '1 minuto',
          :other => '{{count}} minutos'
        },
        :about_x_hours => {
          :one => 'aproximadamente 1 hora',
          :other => 'aproximadamente {{count}} horas'
        },
        :x_days => {
          :one => '1 dia',
          :other => '{{count}} dias'
        },
        :about_x_months => {
          :one => 'aproximadamente 1 mês',
          :other => 'aproximadamente {{count}} meses'
        },
        :x_months => {
          :one => '1 mês',
          :other => '{{count}} meses'
        },
        :about_x_years => {
          :one => 'aproximadamente 1 ano',
          :other => 'aproximadamente {{count}} anos'
        },
        :over_x_years => {
          :one => 'mais de 1 ano',
          :other => 'mais de {{count}} anos'
        }
      }
    },

    # numeros
    :number => {
      :format => {
        :precision => 3,
        :separator => ',',
        :delimiter => '.'
      },
      :currency => {
        :format => {
          :unit => 'R$',
          :precision => 2,
          :format => '%u%n'
        }
      }
    },

    # Active Record
    :activerecord => {
      :errors => {
        :template => {
          :header => {
            :one => "{{model}} não pôde ser salvo: 1 erro",
            :other => "{{model}} não pôde ser salvo: {{count}} erros."
          },
          :body => "Por favor, cheque os seguintes campos:"
        },
        :messages => {
          :inclusion => "não está incluso na lista",
          :exclusion => "não está disponível",
          :invalid => "não é válido",
          :confirmation => "não bate com a confirmação",
          :accepted => "precisa ser aceito",
          :empty => "não pode ser vazio",
          :blank => "não pode ser vazio",
          :too_long => "é muito longo (não mais do que {{count}} caracteres)",
          :too_short => "é muito curto (não menos do que {{count}} caracteres)",
          :wrong_length => "não é do tamanho correto (precisa ter {{count}} caracteres)",
          :taken => "não está disponível",
          :not_a_number => "não é um número",
          :greater_than => "precisa ser maior do que {{count}}",
          :greater_than_or_equal_to => "precisa ser maior ou igual a {{count}}",
          :equal_to => "precisa ser igual a {{count}}",
          :less_than => "precisa ser menor do que {{count}}",
          :less_than_or_equal_to => "precisa ser menor ou igual a {{count}}",
          :odd => "precisa ser ímpar",
          :even => "precisa ser par"
        }
      }
    }
  }
}