#define VDATA_SIZE DATA_ELEMENTS

// TRIPCOUNT indentifier
const unsigned int c_dt_size = VDATA_SIZE;

//struct v_dt {
  //uint32_t data[VDATA_SIZE];
//} __attribute__((aligned(128)));

typedef struct v_datatype { unsigned int data[VDATA_SIZE]; } v_dt;
