class MedicalRecordsController < ApplicationController
    before_action :set_medical_record, only: [:show, :edit, :update, :destroy]
  
    # GET /medical_records
    # GET /medical_records.json
    def index
      render proper_index_by_user
    end
  
    # GET /medical_records/1
    # GET /medical_records/1.json
    def show
      @medical_record = MedicalRecord.new
    end
  
    # GET /medical_records/new
    def new

      @medical_record = MedicalRecord.new

      @medical_record.practice_email = params[:prac]
      
      @practices = Practice.all
      @doctor_choices = {
        "Select a practice" => ""
      }

      @practices.each do |practice|
        @doctor_choices.store(practice.first_name + " " + practice.last_name, practice.email)
      end

      render proper_new_by_user
    end
  
    # GET /medical_records/1/edit
    def edit
      @medical_record = MedicalRecord.new
    end
  
    # POST /medical_records
    # POST /medical_records.json
    def create
      @medical_record = MedicalRecord.new(medical_record_params)
      @practice = Practice.find_by(email: @medical_record.practice_email)

      current_patient.medical_records << @medical_record

      @medical_record.patient_email = current_patient.email
      @medical_record.practice_email = @practice.email

      @medical_record.patient_id = current_patient.id
      @medical_record.practice_id = @practice.id
  
      respond_to do |format|
        if @medical_record.save
          format.html { redirect_to medical_records_path, notice: 'Medical Record was successfully created.' }
          format.json { render :show, status: :created, location: @medical_record }
        else
          format.html { render :new }
          format.json { render json: @medical_record.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /medical_records/1
    # PATCH/PUT /medical_records/1.json
    def update
      respond_to do |format|
        if @medical_record.update(medical_record_params)
          format.html { redirect_to @medical_record, notice: 'Medical Record was successfully updated.' }
          format.json { render :show, status: :ok, location: @medical_record }
        else
          format.html { render :edit }
          format.json { render json: @medical_record.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /medical_records/1
    # DELETE /medical_records/1.json
    def destroy
      @medical_record.destroy
      respond_to do |format|
        format.html { redirect_to medical_records_url, notice: 'Medical Record was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
    def proper_index_by_user
      if (current_patient)
        "patient_index"
      elsif (current_practice)
        "practice_index"
      end
    end

    def proper_new_by_user
      if (current_patient)
        "patient_new"
      elsif (current_practice)
        "practice_new"
      end
    end
      # Use callbacks to share common setup or constraints between actions.
      def set_medical_record
        @medical_record = MedicalRecord.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def medical_record_params
        params.require(:medical_record).permit(:title, :file, :patient_email, :practice_email)
      end
  end
  