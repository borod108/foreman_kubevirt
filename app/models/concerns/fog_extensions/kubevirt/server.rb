module FogExtensions
  module Kubevirt
    module Server
      extend ActiveSupport::Concern

      include ActionView::Helpers::NumberHelper

      attr_accessor :image_id

      def to_s
        name
      end

      def state
        status
      end

      def interfaces_attributes=(attrs)
      end

      def volumes_attributes=(attrs)
      end

      def uuid
        name
      end

      def mac
        interfaces.map(&:mac_address).compact.min
      end

      # TODO: Update once new API for reporting IP_ADRESSSES is set
      def ip_addresses
        [interfaces&.first&.ip_address]
      end

      def poweroff
        puts "Poweroff"
      end

      def reset
        puts "Reset"
      end

      def vm_description
        _("%{cpu_cores} Cores and %{memory} memory") % {:cpu_cores => cpu_cores, :memory => number_to_human_size(memory.to_i)}
      end

      def select_nic(fog_nics, nic)
        puts "select_nic"
        fog_nics[0]
      end
    end
  end
end
