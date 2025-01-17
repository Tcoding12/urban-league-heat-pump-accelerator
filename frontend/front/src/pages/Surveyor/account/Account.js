import { Box, Button, Stack } from "@mui/material";

import AccountDetail from "./AccountDetail";
import { BackButton } from "../Components/BackButton";
import ContainerTitle from "../../Admin/component/ContainerTitle";
import { Link } from "react-router-dom";
import React from "react";
import { useSelector } from "react-redux";

const Account = () => {
  const { firstName, lastName, email, address, phoneNumber } = useSelector(
    (state) => state.account
  );
  return (
    <>
      <BackButton url="/surveyor/dashboard" description="dashboard" />
      <ContainerTitle name="My Account">
        <Stack direction="column" gap={1}>
          <AccountDetail label="First Name" value={firstName} />
          <AccountDetail label="Last Name" value={lastName} />
          <AccountDetail label="Email" value={email} />
          <AccountDetail label="Address" value={address} />
          <AccountDetail label="Phone Number" value={phoneNumber} />
        </Stack>

        <Stack direction="column">
          <Box display="flex" mt={3} mb={2} px={2}>
            <Button variant="contained" component={Link} to="edit">
              Edit
            </Button>
          </Box>
          <Box p={1} sx={{ borderBottom: "1px dashed grey" }} />
          <Box display="flex" mt={3} mb={2} px={2}>
            <Button variant="contained" disabled={true}>
              Request New Assignment
            </Button>
          </Box>
        </Stack>
      </ContainerTitle>
    </>
  );
};

export default Account;
