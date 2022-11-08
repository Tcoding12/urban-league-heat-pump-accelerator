import { Box, Button, Grid, Typography } from "@mui/material";
import React from "react";
import AccountDetail from "./AccountDetail";

const Account = () => {
  return (
    <Box>
      <Grid container direction='column' rowSpacing={1}>
        <Grid item xs={12}>
          <Box display='flex' px={2} pt={3}>
            <Typography variant='h2' component='h2'>
              My Account
            </Typography>
          </Box>
        </Grid>
        <AccountDetail label='First Name' value='John' />
        <AccountDetail label='Last Name' value='Smith' />
        <AccountDetail label='Email' value='jsmith@example.com' />
        <AccountDetail label='Address' value='12345 John Smith Way' />
        <AccountDetail label='Phone Number' value='(123) 456-7890' />
      </Grid>
      <Grid container direction='column' rowSpacing={4}>
        <Grid item xs={12}>
          <Box display='flex' mt={3} mb={2} px={2}>
            <Button variant='contained'>Edit</Button>
          </Box>
          <Box p={1} sx={{ borderBottom: "1px dashed grey" }} />
          <Box display='flex' mt={3} mb={2} px={2}>
            <Button variant='contained' disabled={true}>
              Request New Assignment
            </Button>
          </Box>
        </Grid>
      </Grid>
    </Box>
  );
};

export default Account;
